fpath=("$DOTFILES_ROOT/zsh-completions-osx" "$DOTFILES_ROOT/zsh-completions/src" $fpath)

# Initialize.
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

# Enable completion selection with arrow keys.
zstyle ':completion:*:default' menu select=2

# Show uppercase candidates with lowercase input.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
