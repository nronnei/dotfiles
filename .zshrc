# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source "${ZDOTDIR:-$HOME}/.zaliases"

if [[ $(uname) == "Darwin" ]]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
