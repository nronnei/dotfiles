#!/bin/bash

os="$(uname)"

if [[ "$os" == "Linux" ]]; then
    xclip -o --selection clipboard | tmux load-buffer - && tmux paste-buffer
else
    ~/.tmux/safe-reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer
fi
