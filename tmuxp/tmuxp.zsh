if ! (( $+commands[tmuxp] ))
then
    print "zsh tmuxp plugin: tmuxp not found. Please install tmuxp before using this plugin." >&2
    return 1
fi

function tpl() {
    if (( $+commands[fzf] ))
    then
        config="$(tmuxp ls | fzf)"
        if [[ -z $config ]]
        then
            echo "config not selected"
            return 1
        fi

        tmuxp load "$@" $config
    else
        tmuxp load "$@"
    fi
}

alias tp="tmuxp"
alias tply="tpl -y"
alias tpld="tpl -d"
