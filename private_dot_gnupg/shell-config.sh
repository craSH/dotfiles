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
