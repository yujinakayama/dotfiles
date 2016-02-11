#!/usr/bin/env bash

# https://github.com/sstephenson/ruby-build/wiki

cd "$(dirname "$BASH_SOURCE")"
source ../functions/command_exist.sh

./package_manager.sh || exit 1

if [[ $(uname -s) == 'Darwin' ]]; then
  if ! command_exist xcode-select; then
    echo 'Please install Xcode first.'
    open 'https://itunes.apple.com/jp/app/xcode/id497799835'
    exit 1
  fi

  brew install openssl libyaml readline

  export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"
elif command_exist apt-get; then
  sudo apt-get install --yes build-essential autoconf libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev
elif command_exist pacman; then
  sudo pacman -S --force --needed gcc zlib readline autoconf make
fi

if [[ -d "$HOME/.rbenv" ]]; then
  rbenv update
else
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
  git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update

  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

ruby_version="$1"

if [[ -z $ruby_version ]]; then
  ruby_version="$(basename "$(ls ~/.rbenv/plugins/ruby-build/share/ruby-build/2.3.* | egrep -v 'dev|pre|rc' | sort | tail -1)")"
fi

rbenv install "$ruby_version"
rbenv shell "$ruby_version"

gem update --system
gem install bundler pry
gem clean
