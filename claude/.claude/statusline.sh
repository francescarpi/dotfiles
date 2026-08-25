#!/usr/bin/env bash
# Claude Code statusline: estilo/agente, repo:rama, contexto, limites 5h y semanal,
# coste y duracion de la sesion, modelo.
# Recibe por stdin el JSON de estado que le pasa Claude Code.
set -uo pipefail

JQ=${JQ:-/usr/bin/jq}
command -v "$JQ" >/dev/null 2>&1 || JQ=jq

input=$(cat)
[ -n "$input" ] || exit 0

dir=$(printf '%s' "$input" | "$JQ" -r '.workspace.current_dir // .cwd // ""' 2>/dev/null)
branch=""
if [ -n "$dir" ] && [ -d "$dir" ]; then
  branch=$(git -C "$dir" branch --show-current 2>/dev/null || true)
fi

ESC=$(printf '\033')

printf '%s' "$input" | "$JQ" -r --arg branch "$branch" --arg e "$ESC" '
def c($n): $e + "[" + $n + "m";
def rst: c("0");
def dim: c("2");

# segundos -> "3d13h" / "4h19m" / "7m"
def fmtdur($s):
  ($s | floor) as $t
  | if $t <= 0 then "now"
    elif $t >= 86400 then "\(($t/86400)|floor)d\((($t%86400)/3600)|floor)h"
    elif $t >= 3600  then "\(($t/3600)|floor)h\((($t%3600)/60)|floor)m"
    else "\(($t/60)|floor)m"
    end;

def pctcol($p): if $p >= 80 then c("1;31") elif $p >= 50 then c("33") else c("32") end;
def pctseg($label; $p):
  ($p // 0) as $v
  | pctcol($v) + $label + ":" + (($v|floor)|tostring) + "%" + rst;

def money($v):
  (($v * 100) | round) as $cents
  | "$" + (($cents / 100) | floor | tostring) + "."
        + (if ($cents % 100) < 10 then "0" else "" end)
        + (($cents % 100) | tostring);

(.agent.name // .output_style.name // "default")               as $style
| (.workspace.current_dir // .cwd // "")                       as $dir
| (($dir | split("/") | map(select(length > 0)) | last) // "?") as $base
| (.context_window.used_percentage)                            as $ctx
| (.rate_limits.five_hour)                                     as $h5
| (.rate_limits.seven_day)                                     as $wk
| (.cost.total_cost_usd // 0)                                  as $usd
| (.cost.total_duration_ms // 0)                               as $ms
| (.model.id // .model.display_name // "?")                    as $mid
| [ c("36") + "[" + $style + "]" + rst,
    c("32") + "[" + $base + (if $branch == "" then "" else ":" + $branch end) + "]" + rst ]
  + (if $ctx == null then [] else [ pctseg("ctx"; $ctx) ] end)
  + (if $h5 == null then [] else [ pctseg("5h"; $h5.used_percentage) ] end)
  + (if ($h5 != null and $h5.resets_at != null)
     then [ dim + "reset:" + fmtdur($h5.resets_at - now) + rst ] else [] end)
  + (if $wk == null then [] else [ pctseg("week"; $wk.used_percentage) ] end)
  + (if ($wk != null and $wk.resets_at != null)
     then [ dim + "week-reset:" + fmtdur($wk.resets_at - now) + rst ] else [] end)
  + (if $usd > 0 then [ c("35") + money($usd) + rst ] else [] end)
  + (if $ms  > 0 then [ dim + fmtdur($ms / 1000) + rst ] else [] end)
  + [ c("2;37") + ($mid | sub("^claude-"; "")) + rst ]
| join(" ")
' 2>/dev/null || true
