#!/usr/bin/env zsh

function virtualenv_info { 
[ $VIRTUAL_ENV ] && echo ‘(‘`basename $VIRTUAL_ENV`’) ‘ 
}

RPROMPT+='%{$fg[green]%}$(virtualenv_prompt_info)%{$reset_color%}%'
PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
