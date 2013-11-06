
# Use Emacs style key bindings.
bindkey -e

# Bind alt-leftarrow and alt-rightarrow for word moving.
bindkey '^[\e[C' forward-word
bindkey '^[\e[D' backward-word

# Override history-incremental-search-backward with
# history-incremental-pattern-search-backward that allows to search history with pattern.
# Also add forward search.
if is-at-least 4.3.10; then
  bindkey '^R' history-incremental-pattern-search-backward
  bindkey '^S' history-incremental-pattern-search-forward
fi
