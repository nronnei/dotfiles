#!/bin/bash

os="$(uname)"

if [[ "$os" == Linux ]]; then
    if [[ "$(command -v playerctl)" != "" ]]; then
        echo "$(playerctl metadata xesam:artist | cut -c 1-15) - $(playerctl metadata xesam:title | cut -c 1-30)"
    else
        echo "No music"
    fi
else
    # TODO look for OS X
    echo $(osascript ~/dotfiles/.tmux/scripts/music/current_music.app)
fi
