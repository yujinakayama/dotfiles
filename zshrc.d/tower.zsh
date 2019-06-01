if command_exist gittower; then
  # Convenience way to open the current project with Tower.app.
  tower() {
    directory="$(pwd)"

    until [ "$directory" = "/" ]; do
      if [ -d "$directory/.git" ]; then
        gittower "$directory"
        return 0
      fi

      directory="$(dirname "$directory")"
    done

    echo "Error: No git directory found in the ancestor directories" >&2
    return 1
  }
fi
