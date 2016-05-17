if [[ -d "$HOME/.go" ]]; then
  export GOPATH="$HOME/.go"
  path=($path "$GOPATH/bin")
fi
