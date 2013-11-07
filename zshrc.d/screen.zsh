
if [[ $TERM == screen ]]; then
  # Show the current directory in region title.
  _screen_precmd() {
    local truncation_length=36

    local current_path="$PWD"

    # Replace path to the home directory with "~".
    # "#" means whether $HOME is at beginning of $current_path.
    current_path=${current_path/#"${HOME}"/"~"} # "

    if [[ ${#current_path} -gt $truncation_length ]]; then
      local side_length=$(( $truncation_length / 2 ))
      local omission="..."
      current_path="$current_path[1,$side_length]$omission$current_path[-$side_length,-1]"
    fi

    echo -ne "\ek${current_path}\e\\"
  }

  add-zsh-hook precmd _screen_precmd

  # Show the process name in region title.
  _screen_preexec() {
    echo -ne "\ek${1%% *}\e\\"
  }

  add-zsh-hook preexec _screen_preexec
fi

if command_exist screen; then
  # Convenience way to open a project with screen.
  project-screen() {
    local project_path="$1"
    cd "$project_path"
    local project_name=$(basename "$project_path")
    screen -S "$project_name"
  }
fi
