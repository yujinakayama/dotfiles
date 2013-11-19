#!/usr/bin/env bash

command_exist() {
  local command="$1"
  command -v "$command" > /dev/null 2> /dev/null
  return $?
}

installation_path="$HOME/.dotfiles"

if [[ -d "$installation_path" ]]; then
  echo "Already installed."
  exit
fi

if ! command_exist git; then
  echo "Installing git..."

  if command_exist apt-get; then
    sudo apt-get install --yes git
  elif command_exist brew; then
    brew install git
  else
    echo "Cannot install git. Aborting."
    exit 1
  fi
fi

git clone --recurse-submodules https://github.com/yujinakayama/dotfiles.git "$installation_path"

"$installation_path/bin/dotfiles-sync"

echo "Done."
