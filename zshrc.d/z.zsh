
# Enable z installed with Homebrew.
if [[ -x =brew && -e "$(brew --prefix)/etc/profile.d/z.sh" ]]; then
  source "$(brew --prefix)/etc/profile.d/z.sh"
fi
