
# Enable z installed with Homebrew.
if command_exist brew && [[ -e "$(brew --prefix)/etc/profile.d/z.sh" ]]; then
  source "$(brew --prefix)/etc/profile.d/z.sh"
fi
