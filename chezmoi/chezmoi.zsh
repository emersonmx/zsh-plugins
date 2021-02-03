if ! (( $+commands[chezmoi] ))
then
    print "zsh chezmoi plugin: chezmoi not found. Please install chezmoi before using this plugin." >&2
    return 1
fi

alias cz="chezmoi"
alias czcd="chezmoi cd"
alias cza="chezmoi add"
alias cze="chezmoi edit"
alias czec="chezmoi edit-config"
alias czdf="chezmoi diff"
alias czap="chezmoi apply"
alias czme="chezmoi merge"
alias czca="chezmoi chattr"
alias czma="chezmoi managed"
alias czum="chezmoi unmanaged"

if (( $+commands[fzf] ))
then
    function _chezmoi_fzf() {
        managed_file="$(chezmoi managed | fzf)"
        [[ -n $managed_file ]] && echo $managed_file || return 1
    }

    function fcze() {
        chezmoi edit "$(_chezmoi_fzf)"
    }

    function fczdf() {
        chezmoi diff "$(_chezmoi_fzf)"
    }

    function fczap() {
        chezmoi apply -v "$(_chezmoi_fzf)"
    }

    function fczme() {
        chezmoi merge "$(_chezmoi_fzf)"
    }

    function fczca() {
        chezmoi chattr "$(_chezmoi_fzf)"
    }
fi
