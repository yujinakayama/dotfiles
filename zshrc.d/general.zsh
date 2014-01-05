
# Disable auto-cd enabled by oh-my-zsh.
unsetopt auto_cd

if [[ -d $HOME/Projects ]]; then
  # Allow to cd to each project directory without prefix ~/Projects.
  cdpath=("$HOME/Projects" "$cdpath")
fi

# Stack all `cd`-ed paths automatically.
# They can be call by `cd -[tab]`.
setopt auto_pushd

# Do not stack same path.
setopt pushd_ignore_dups

# Share history between terminals.
setopt share_history

# Ignore same command in entire history.
setopt hist_ignore_all_dups

# Remove extra blanks when adding commands to history.
setopt hist_reduce_blanks

# Ignore same command in entire history with history search.
setopt hist_find_no_dups

# Do not add commands which start with blank character to history.
setopt hist_ignore_space

# Enable extended wildcard. (e.g. *~exception)
setopt extended_glob

# Do not beep when displaing completion list.
setopt no_listbeep

# Specify characters which are NOT word boundary.
# * Excluding "/" allows directory moving in path.
# * Excluding "." allows address or extension moving.
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
