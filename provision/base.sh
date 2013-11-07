#!/usr/bin/env bash

cd "$(dirname "$BASH_SOURCE")"

./prepare.sh || exit 1

if [[ $(uname -s) == 'Darwin' ]]; then
  brew install emacs git tree z zsh zsh-completions
  brew install --HEAD screen
else
  sudo apt-get install --yes emacs24-nox git screen tree zsh
fi
