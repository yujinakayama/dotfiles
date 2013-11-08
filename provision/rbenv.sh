#!/usr/bin/env bash

# https://github.com/sstephenson/ruby-build/wiki

if [[ -d "$HOME/.rbenv" ]]; then
  echo 'Already installed.'
  exit
fi

cd "$(dirname "$BASH_SOURCE")"
source ../functions/command_exist.sh

./prepare.sh || exit 1

if [[ $(uname -s) == 'Darwin' ]]; then
  if ! command_exist xcode-select; then
    echo 'Please install Xcode first.'
    open 'https://itunes.apple.com/jp/app/xcode/id497799835'
    exit 1
  fi

  brew install openssl libyaml readline

  export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"
else
  sudo apt-get install --yes build-essential autoconf libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev
fi

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems

default_gems_path="$HOME/.rbenv/default-gems"

cat <<END > "$default_gems_path"
bundler
guard-rspec
guard-rubocop
pry-debugger
rails
sinatra
END

if [[ $(uname -s) == 'Darwin' ]]; then
cat <<END >> "$default_gems_path"
cocoapods
nomad-cli
ruby_gntp
END
fi

latest_2_0="$(basename "$(ls ~/.rbenv/plugins/ruby-build/share/ruby-build/2.0.* | egrep -v 'dev|pre|rc' | sort | tail -1)")"

rbenv install "$latest_2_0"
rbenv global "$latest_2_0"

~/.rbenv/shims/gem update --system
~/.rbenv/shims/gem clean
