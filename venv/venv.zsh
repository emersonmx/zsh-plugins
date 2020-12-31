ZSH_VENV_DIRNAME=".venv"

function mkvenv() {
    python -m venv "$ZSH_VENV_DIRNAME"
    source "$ZSH_VENV_DIRNAME/bin/activate"
    pip install --upgrade pip setuptools wheel
}

alias rmvenv="rm -rI \"$ZSH_VENV_DIRNAME\""
alias source-venv="source \"$ZSH_VENV_DIRNAME/bin/activate\""
