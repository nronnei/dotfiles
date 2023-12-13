#!/bin/bash

music_file="$HOME/.tmux/scripts/music/current_music_app"

if [ $# -lt 1 ]; then
    echo "Spotify" > $music_file
else 
    echo "$@" > $music_file
fi


