
# Enable zsh-completions installed with Homebrew.
if [[ -x =brew && -d "$(brew --prefix)/share/zsh-completions" ]]; then
  fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
fi
