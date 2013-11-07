#!/usr/bin/env bash

command_exists() {
  local command="$1"
  type "$command" > /dev/null 2> /dev/null
  return $?
}

installation_path="$HOME/.dotfiles"

if [[ -d "$installation_path" ]]; then
  echo "Already installed."
  exit
fi

if ! command_exists git; then
  echo "Installing git..."

  if command_exists apt-get; then
    sudo apt-get install --yes git
  elif command_exists brew; then
    brew install git
  else
    echo "Cannot install git. Aborting."
    exit 1
  fi
fi

git clone https://github.com/yujinakayama/dotfiles.git "$installation_path"

"$installation_path/bin/dotfiles-sync"

echo "Done."
