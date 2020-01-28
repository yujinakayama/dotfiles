if [[ -d "$HOME/.nodenv" ]]; then
  path=("$HOME/.nodenv/bin" $path)
  eval "$(nodenv init -)"
fi
