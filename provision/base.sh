#!/usr/bin/env bash

cd "$(dirname "$BASH_SOURCE")"
source ../functions/command_exist.sh

./package_manager.sh || exit 1

if [[ $(uname -s) == 'Darwin' ]]; then
  brew bundle
elif command_exist apt-get; then
  sudo apt-get install --yes emacs24-nox git screen tree zsh
elif command_exist pacman; then
  sudo pacman -S --force --needed abs dnsutils emacs-nox git psmisc sudo tcpdump the_silver_searcher tree zsh
fi
