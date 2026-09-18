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
alias cmap="chezmoi apply"
alias cmapf="chezmoi apply --force"
alias cmme="chezmoi merge"

function cmdff() {
    chezmoi diff | grep '^diff' | cut -d' ' -f3 | sed 's/^a/~/'
}

if (( $+commands[fzf] ))
then
    function fcme() {
        chezmoi edit "$(chezmoi managed -p absolute | sed "s#$HOME#~#g" | fzf)"
    }

    function fcmdf() {
        chezmoi diff "$(cmdff | fzf)"
    }

    function fcmap() {
        chezmoi apply -v "$(cmdff | fzf)"
    }

    function fcmme() {
        chezmoi merge "$(cmdff | fzf)"
    }
fi
