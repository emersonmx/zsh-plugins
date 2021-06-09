ZSH_PYTHON_VENV_DIRNAME=".venv"

function mkvenv() {
    virtualenv "$ZSH_PYTHON_VENV_DIRNAME"
    source "$ZSH_PYTHON_VENV_DIRNAME/bin/activate"
    pip install --upgrade pip setuptools wheel
}

function rmvenv() {
    [[ $(command -v deactivate) ]] && deactivate
    rm -rI "$ZSH_PYTHON_VENV_DIRNAME"
}

function mkpypkg() {
    pkgname="$1"
    mkdir -p "$pkgname"
    touch "$pkgname/__init__.py"
}

alias source-venv="source \"$ZSH_PYTHON_VENV_DIRNAME/bin/activate\""
alias py="python"
alias ipy="ipython"
alias pfr="pip freeze > requirements.txt"
alias pir="pip install -r requirements.txt"
