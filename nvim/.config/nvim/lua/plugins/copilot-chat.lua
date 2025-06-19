local prompts = {
  TranslateEn = "Translate this text to English",
  TranslateEs = "Translate this text to Spanish",
  Commit = "#git prepare the commit message",
}

local mcphub = function(chat)
  local mcp = require("mcphub")
  mcp.on({ "servers_updated", "tool_list_changed", "resource_list_changed" }, function()
    local hub = mcp.get_hub_instance()
    if not hub then
      return
    end

    local async = require("plenary.async")
    local call_tool = async.wrap(function(server, tool, input, callback)
      hub:call_tool(server, tool, input, {
        callback = function(res, err)
          callback(res, err)
        end,
      })
    end, 4)

    local access_resource = async.wrap(function(server, uri, callback)
      hub:access_resource(server, uri, {
        callback = function(res, err)
          callback(res, err)
        end,
      })
    end, 3)

    for name, tool in pairs(chat.config.functions) do
      if tool.id and tool.id:sub(1, 3) == "mcp" then
        chat.config.functions[name] = nil
      end
    end
    local resources = hub:get_resources()
    for _, resource in ipairs(resources) do
      local name = resource.name:lower():gsub(" ", "_"):gsub(":", "")
      chat.config.functions[name] = {
        id = "mcp:" .. resource.server_name .. ":" .. name,
        uri = resource.uri,
        description = type(resource.description) == "string" and resource.description or "",
        resolve = function()
          local res, err = access_resource(resource.server_name, resource.uri)
          if err then
            error(err)
          end

          res = res or {}
          local result = res.result or {}
          local content = result.contents or {}
          local out = {}

          for _, message in ipairs(content) do
            if message.text then
              table.insert(out, {
                uri = message.uri,
                data = message.text,
                mimetype = message.mimeType,
              })
            end
          end

          return out
        end,
      }
    end

    local tools = hub:get_tools()
    for _, tool in ipairs(tools) do
      chat.config.functions[tool.name] = {
        id = "mcp:" .. tool.server_name .. ":" .. tool.name,
        group = tool.server_name,
        description = tool.description,
        schema = tool.inputSchema,
        resolve = function(input)
          local res, err = call_tool(tool.server_name, tool.name, input)
          if err then
            error(err)
          end

          res = res or {}
          local result = res.result or {}
          local content = result.content or {}
          local out = {}

          for _, message in ipairs(content) do
            if message.type == "text" then
              table.insert(out, {
                data = message.text,
              })
            elseif message.type == "resource" and message.resource and message.resource.text then
              table.insert(out, {
                uri = message.resource.uri,
                data = message.resource.text,
                mimetype = message.resource.mimeType,
              })
            end
          end

          return out
        end,
      }
    end
  end)
end

local keys = {
  {
    "<leader>aa",
    "<cmd>CopilotChatToggle<CR>",
    mode = { "n", "v" },
    desc = "Toggle Copilot Chat",
  },
  {
    "<leader>ap",
    "<cmd>CopilotChatPrompts<CR>",
    mode = { "n", "v" },
    desc = "Open Copilot Chat Prompts",
  },
}

local SYSTEM_PROMPT = [[
You are a code-focused AI programming assistant that specializes in practical software engineering solutions.
When asked for your name, you must respond with "GitHub Copilot".
Follow the user's requirements carefully & to the letter.
Follow Microsoft content policies.
Avoid content that violates copyrights.
If you are asked to generate content that is harmful, hateful, racist, sexist, lewd, violent, or completely irrelevant to software engineering, only respond with "Sorry, I can't assist with that."
Keep your answers short and impersonal.
The user works in an IDE called Neovim which has a concept for editors with open files, integrated unit test support, an output pane that shows the output of running the code as well as an integrated terminal.
The user is working on a Darwin machine. Please respond with system specific commands if applicable.
You will receive code snippets that include line number prefixes - use these to maintain correct position references but remove them when generating output.

When presenting code changes:

1. For each change, first provide a header outside code blocks with format:
   [file:<file_name>](<file_path>) line:<start_line>-<end_line>

2. Then wrap the actual code in triple backticks with the appropriate language identifier.

3. Keep changes minimal and focused to produce short diffs.

4. Include complete replacement code for the specified line range with:
   - Proper indentation matching the source
   - All necessary lines (no eliding with comments)
   - No line number prefixes in the code

5. Address any diagnostics issues when fixing code.

6. If multiple changes are needed, present them as separate blocks with their own headers.

Regarding the format of the responses:
- It has to be in markdown
- The code has to go in code blocks
- Lists have to go with hyphens instead of asterisks. For example:
  - item1
  - item2

When asked to generate a commit message, it must follow the "conventional commits" rules. For example:
- feat: add new feature
- fix: fix a bug
- refactor: refactor code

Note: The commit title must be in lowercase.
Also add a brief description of the commit.
]]

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    build = "make tiktoken",
    cmd = "CopilotChat",
    keys = keys,
    opts = {
      prompts = prompts,
      -- model = "o4-mini",
      system_prompt = SYSTEM_PROMPT,
    },
    config = function(_, opts)
      local chat = require("CopilotChat")

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = false
        end,
      })

      chat.setup(opts)

      -- https://github.com/CopilotC-Nvim/CopilotChat.nvim/pull/1029/files
      -- Uncomment this code when the PR is merged
      if chat.config.functions ~= nil then
        mcphub(chat)
      end
    end,
  },
}
