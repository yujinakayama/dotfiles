if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  path=("$PYENV_ROOT/bin" $path)
  eval "$(pyenv init -)"
fi
