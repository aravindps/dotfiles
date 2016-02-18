if [ -e ~/.bash_aliases_local ]; then
    source ~/.bash_aliases_local
fi

if [ -e ~/.bash_aliases_work ]; then
    source ~/.bash_aliases_work
fi

## alternate keys are given for easy switch between keybroad layouts
alias xcapemap='xcape -e "Control_R=Return;Control_L=Escape;Shift_L=Delete;Shift_R=BackSpace" && echo "dual mode Ctrl_R|Return, Ctrl_L|Esc, Shift_R|Backspace and Shift_L|Delete"'
alias xcapekill='pkill xcape'
alias aoeu='setxkbmap en_US && xcapekill && echo "set to qwerty layout"'
alias swapkey='xmodmap ~/.config/xmodmap.swapkeys && xcapemap && echo "control, caps and enter are remapped"'
alias numkey='xmodmap ~/.config/xmodmap.dvorak_number && echo "Made top alpha row as numeric"'
alias asdf='setxkbmap dvorak && echo "set to dvorak layout" && numkey && swapkey'

## General utilitly
alias mv='mv -i'
alias rm_force='rm'
alias rm='mv -it ~/trash/'
alias emacs='emacs -nw'
alias tx='tmux -2 -u'
alias xc='xclip -selection clipboard'
alias pwdc='pwd | tr -d "\n" | xc'
alias v='vim'
alias :e='v'
alias gv='vim --servername GVIM --remote'

## eclipse vim
alias veclipse='vim -c "PingEclim" -c "ProjectsTree"'

## display setting for crunchbang
alias ds_default='~/.screenlayout/default.sh'
alias ds_dual_monitor='~/.screenlayout/dual_monitor.sh'
alias ds_only_external='~/.screenlayout/only_external.sh'
alias ds_projector='~/.screenlayout/projector.sh'

## git alias
alias gf='git fetch '
alias gst='git status '
alias gd='git diff '
alias gb='git branch '
alias gc='git commit -v '
alias gco='git checkout '
alias glol='git log --graph --oneline --decorate --date=relative --all'
alias gpwd='git rev-parse --abbrev-ref HEAD'
alias gp2o='git push --set-upstream origin `gpwd`'
alias gDelMergedBranch='git branch --merged  | grep "*" -v | xargs git branch -d'

gMsg(){
	git show $* | sed -n '/^Date:/,/^diff --git/p' | sed -e '1d;$d' | xc
}
alias gMsg='gMsg'

## misc
log_errors(){
    grep "ERROR]:" $*  | grep "http.*" -o | sort -u
}
alias uerrors='log_errors'
