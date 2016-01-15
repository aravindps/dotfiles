## My config
autoload -Uz select-word-style
select-word-style bash

autoload -Uz compinit
compinit

unsetopt no_match

source ~/.bash_aliases
if [[ $TERM == xterm ]]; then
	TERM=xterm-256color
fi

figlet "Just Do It"
