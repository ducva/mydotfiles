#!/usr/bin/env zsh

function virtualenv_info { 
[ $VIRTUAL_ENV ] && echo ‘(‘`basename $VIRTUAL_ENV`’) ‘ 
}

PROMPT+='%{$fg[green]%}$(virtualenv_prompt_info)%{$reset_color%}%'
