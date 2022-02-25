if [[ -z "$TTY" ]]; then
  if ! TTY=$(tty >/dev/null 2>&1); then
    echo "WARNING: Unable to determine current tty device - gpg-agent may fail (source: $0)" >&2
  fi
  export TTY
fi

export GPG_TTY=$TTY

export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1

resetcard() {
  rm -r ~/.gnupg/private-keys-v1.d
  gpgconf --kill gpg-agent
  gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
  gpg --card-status
}
