local user_host="%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}"
local ret_status="%(?:%{$fg[green]%} ○●:%{$fg[red]%} ○●)%{$reset_color%}"
local time_now="%{$fg[yellow]%}/%D{%m-%d}/%D{%H:%M:%S}/%{$reset_color%}"
PROMPT='${time_now}%{$fg[cyan]%}%c%{$reset_color%}$(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[green]%})%{$reset_color%}%{$fg[yellow]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
