if ! (( $+commands[tmuxp] ))
then
    print "zsh tmuxp plugin: tmuxp not found. Please install tmuxp before using this plugin." >&2
    return 1
fi

function tpl() {
    if (( $+commands[fzf] ))
    then
        tmuxp load "$@" $(tmuxp ls | fzf)
    else
        tmuxp load "$@"
    fi
}

alias tp="tmuxp"
alias tply="tpl -y"
alias tpld="tpl -d"
