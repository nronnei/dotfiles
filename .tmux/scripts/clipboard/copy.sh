#!/bin/bash

os="$(uname)"

if [[ "$os" == "Linux" ]]; then
    xclip -i --selection clipboard
else
    ~/dotfiles/.tmux/safe-reattach-to-user-namespace pbcopy
fi
