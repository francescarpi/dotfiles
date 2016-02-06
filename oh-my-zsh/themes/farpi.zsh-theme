# farpi theme

local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'

function repo_branch {
    hg root >/dev/null 2>/dev/null && printf '[%s]' $(hg branch) && return
    git branch >/dev/null 2>/dev/null && printf '[%s]' $(git branch) && return
}

PROMPT="[${current_dir}]
%B$%b "

RPROMPT='%{$terminfo[bold]$fg[green]%}% $(virtualenv_prompt_info) %{$fg[red]%}% $(repo_branch)%{$reset_color%}'
