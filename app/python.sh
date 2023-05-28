#!/bin/bash

install_pyenv() {
    # Install pyenv
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo -e 'if shopt -q login_shell; then' \
        '\n  export PYENV_ROOT="$HOME/.pyenv"' \
        '\n  export PATH="$PYENV_ROOT/bin:$PATH"' \
        '\n eval "$(pyenv init --path)"' \
        '\nfi' >> ~/.bashrc
    echo -e 'if [ -z "$BASH_VERSION" ]; then'\
        '\n  export PYENV_ROOT="$HOME/.pyenv"'\
        '\n  export PATH="$PYENV_ROOT/bin:$PATH"'\
        '\n  eval "$(pyenv init --path)"'\
        '\nfi' >> ~/.profile
    echo 'if command -v pyenv >/dev/null; then eval "$(pyenv init -)"; fi' >> ~/.bashrc
    source ~/.bashrc
}

install_pipenv() {
    pip3 install pipenv
}

install_poetry() {
    curl -sSL https://install.python-poetry.org | python3 -
    poetry completions bash >> ~/.bash_completion
    source ~/.bash_completion
    source ~/.bashrc
}