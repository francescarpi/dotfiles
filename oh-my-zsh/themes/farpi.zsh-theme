# farpi theme

function repo_branch {
    git branch >/dev/null 2>/dev/null && printf '[%s]' $(git_current_branch)  && return
    hg root >/dev/null 2>/dev/null && printf '[%s]' $(hg branch) && return
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local repo_branch='%{$terminfo[bold]$fg[red]%}$(repo_branch)%{$reset_color%}'
local virtualenv_prompt='%{$terminfo[bold]$fg[green]%}$(virtualenv_prompt_info)%{$reset_color%}'

PROMPT="${current_dir} ${repo_branch} ${virtualenv_prompt}
%B➤%b "
RPS1="${return_code}"
