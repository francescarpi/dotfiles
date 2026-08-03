// wezterm-status: report opencode agent state to wezterm via `wezterm cli set-user-var`.
// Goes through the wezterm unix socket directly (no escape-sequence buffering risk).
// Falls back to OSC 1337 if the CLI is unavailable.

const STATUS_ICONS = {
  working: "🕐",
  blocked: "❓",
};

const OPENCODE_ICON = "🤖";

const ALL_ICONS = [...Object.values(STATUS_ICONS), OPENCODE_ICON];

const ICON_REGEX = new RegExp(`(?:\\s*(?:${ALL_ICONS.join("|")}))+$`);

function isWezterm() {
  return process.env.TERM_PROGRAM === "WezTerm" || Boolean(process.env.WEZTERM_EXECUTABLE);
}

function isChildSession(properties) {
  const info = properties?.info;
  return Boolean(info?.id && info.parentID);
}

const childSessions = new Set();

export const WeztermStatusPlugin = async ({ $ }) => {
  if (!isWezterm()) {
    return {};
  }

  const paneId = process.env.WEZTERM_PANE;
  const weztermBin = process.env.WEZTERM_EXECUTABLE_DIR
    ? `${process.env.WEZTERM_EXECUTABLE_DIR}/wezterm`
    : "wezterm";

  async function getCurrentTabTitle() {
    if (!paneId) return "";
    try {
      const result = await $`${weztermBin} cli list --format json`.quiet();
      const panes = JSON.parse(result.stdout);
      const numericPaneId = parseInt(paneId, 10);
      const pane = panes.find((p) => p.pane_id === numericPaneId);
      return pane?.tab_title ?? "";
    } catch (_e) {
      return "";
    }
  }

  function buildTitle(baseTitle, state, includeOpencodeIcon = true) {
    const parts = [];
    if (baseTitle) parts.push(baseTitle);

    const stateIcon = STATUS_ICONS[state];

    if (!stateIcon && includeOpencodeIcon) {
      parts.push(OPENCODE_ICON);
    }
    if (stateIcon) {
      parts.push(stateIcon);
    }

    if (parts.length === 0) return "";
    return stateIcon ? `${parts.join(" ")} ` : parts.join(" ");
  }

  async function setState(state, includeOpencodeIcon = true) {
    if (!paneId) return;

    const currentTitle = await getCurrentTabTitle();
    const baseTitle = currentTitle.replace(ICON_REGEX, "").trimEnd();
    const newTitle = buildTitle(baseTitle, state, includeOpencodeIcon);

    try {
      await $`${weztermBin} cli set-tab-title --pane-id ${paneId} ${newTitle}`.quiet();
    } catch (_e) {
      // fall through to OSC
    }
  }

  await setState("idle");

  return {
    event: async ({ event }) => {
      const type = event?.type;
      const properties = event?.properties ?? {};

      if (isChildSession(properties)) {
        if (properties.info?.id) {
          childSessions.add(properties.info.id);
        }
        return;
      }

      const sessionID = typeof properties.sessionID === "string" ? properties.sessionID : undefined;
      if (sessionID && childSessions.has(sessionID)) {
        return;
      }

      switch (type) {
        case "session.created":
          await setState("idle");
          break;
        case "session.status": {
          const statusType = properties.status?.type;
          if (statusType === "idle") {
            await setState("idle");
          } else if (statusType === "busy" || statusType === "retry") {
            await setState("working");
          }
          break;
        }
        case "tool.execute.before":
        case "tool.execute.after":
        case "permission.replied":
        case "question.replied":
        case "question.rejected":
        case "session.compacted":
          await setState("working");
          break;
        case "permission.asked":
        case "question.asked":
        case "session.error":
          await setState("blocked");
          break;
        case "session.idle":
          await setState("idle");
          break;
        case "session.deleted":
          await setState("", false);
          break;
        default:
          break;
      }
    },
  };
};
