#!/usr/bin/env bash

cd "$(dirname "$BASH_SOURCE")"
source ../functions/command_exist.sh

./prepare.sh || exit 1

if [[ $(uname -s) == 'Darwin' ]]; then
  brew install emacs git tree the_silver_searcher zsh zsh-completions
  brew install --HEAD screen
elif command_exist apt-get; then
  sudo apt-get install --yes emacs24-nox git screen tree zsh
elif command_exist pacman; then
  sudo pacman -S --force --needed abs dnsutils emacs-nox git psmisc sudo tcpdump the_silver_searcher tree zsh
fi
