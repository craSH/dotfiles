# https://github.com/knqyf263/pet#zsh-prev-function

function prev() {
  PREV=$(fc -lrn | head -n 1)
  zsh -c "pet new -t `printf %q "$PREV"`"
}

function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}

zle -N pet-select
bindkey '^b' pet-select
