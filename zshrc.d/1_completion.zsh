# Enable zsh-completions installed with Homebrew.
if command_exist brew && [[ -d "$(brew --prefix)/share/zsh-completions" ]]; then
  fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
fi

fpath=("$DOTFILES_ROOT/zsh-completions-osx" $fpath)

# Initialize.
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# Enable completion selection with arrow keys.
zstyle ':completion:*:default' menu select=2

# Show uppercase candidates with lowercase input.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
