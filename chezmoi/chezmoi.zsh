if ! (( $+commands[chezmoi] ))
then
    print "zsh chezmoi plugin: chezmoi not found. Please install chezmoi before using this plugin." >&2
    return 1
fi

alias cm="chezmoi"
alias cmcd="chezmoi cd"
alias cma="chezmoi add"
alias cmaa="cmdff | xargs -I{} chezmoi add {}"
alias cme="chezmoi edit"
alias cmec="chezmoi edit-config"
alias cmdf="chezmoi diff"
alias cmv="chezmoi verify"
alias cmap="chezmoi apply"
alias cmapf="chezmoi apply --force"
alias cmme="chezmoi merge"
alias cmca="chezmoi chattr"
alias cmma="chezmoi managed"
alias cmum="chezmoi unmanaged"

function cmdff() {
    chezmoi diff | grep '^diff' | cut -d' ' -f3 | sed 's/^a/~/'
}

if (( $+commands[fzf] ))
then
    function _chezmoi_fzf() {
        managed_file="$(chezmoi managed --path-style absolute | fzf)"
        [[ -n $managed_file ]] && echo $managed_file || return 1
    }

    function fcme() {
        chezmoi edit "$(_chezmoi_fzf)"
    }

    function fcmdf() {
        chezmoi diff "$(_chezmoi_fzf)"
    }

    function fcmap() {
        chezmoi apply -v "$(_chezmoi_fzf)"
    }

    function fcmme() {
        chezmoi merge "$(_chezmoi_fzf)"
    }

    function fcmca() {
        chezmoi chattr "$(_chezmoi_fzf)"
    }
fi
