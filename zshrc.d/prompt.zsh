
if [[ $(uname -s) == Darwin ]]; then
  PROMPT='%m:%1~ %n%# '
else
  PROMPT='%n@%m:%1~%# '
fi

if is-at-least 4.3.10; then
  # Show VCS info at right prompt if inside of any repository.
  # %1v is psvar[1].
  RPROMPT='%S%1v%s'

  # Enable VCS info.
  autoload -Uz vcs_info

  # Set VCS info in psvar[1], referred by RPROMPT.
  _vcs_info_precmd() {
    LANG=en_US.UTF-8 vcs_info
    psvar=()
    psvar[1]=$vcs_info_msg_0_
  }

  add-zsh-hook precmd _vcs_info_precmd
fi
