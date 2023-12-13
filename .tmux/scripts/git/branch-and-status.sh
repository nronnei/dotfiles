#!/bin/bash

# These are the ANSI codes
# red="\033[38;5;160m"
# yellow="\033[38;5;220m"
# orange="\033[38;5;208m"
# green="\033[38;5;34m"
# ltblue="\033[38;5;159m"
# end="\033[0m"

# tmux-ified
red="#[fg=colour160]"
yellow="#[fg=colour220]"
orange="#[fg=colour208]"
green="#[fg=colour34]"
ltblue="#[fg=colour159]"
end="#[fg=default]"


function colorize {
  if [[ "$2" == "orange" ]]
  then
    # Wrap str in an orange
    echo "$orange$1$end"
  elif [[ "$2" == "yellow" ]]
  then
    # Wrap str in a yellow
    echo "$yellow$1$end"
  elif [[ "$2" == "red" ]]
  then
    # Wrap str in a red
    echo "$red$1$end"
  elif [[ "$2" == "green" ]]
  then
    # Wrap str in a green
    echo "$green$1$end"
  elif [[ "$2" == "ltblue" ]]
  then
    # Wrap str in a ltblue
    echo "$ltblue$1$end"
  else
    # Just send back the string unadorned
    echo "$1"
  fi
}

function set_branch_color {

  local STAGED=$(git status --porcelain 2>/dev/null| grep "^M" | wc -l)
  local DIRTY=$(git status --porcelain 2>/dev/null| grep "^ M" | wc -l)

  if [ $DIRTY -ne 0 ] && [ $STAGED -eq 0 ]
  then
    # Wrap str in an red
    echo $(colorize $1 "red")
  elif [ $DIRTY -ne 0 ] && [ $STAGED -ne 0 ]
  then
    # Wrap str in an orange
    echo $(colorize $1 "orange")
  elif [ $DIRTY -eq 0 ] && [ $STAGED -ne 0 ]
  then
    # Wrap str in a yellow
    echo $(colorize $1 "yellow")
  else
    # Wrap str in a green
    echo $(colorize $1 "green")
  fi
}

function staged {
  local staged=$(git status --porcelain 2>/dev/null| grep "^M" | wc -l)
  if [[ $staged -ne 0 ]]
  then
    echo $(colorize "S:$staged" "green")
  else
    echo "S: $staged"
  fi
}

function modified {
  local modified=$(git status --porcelain 2>/dev/null| grep "^ M" | wc -l)
  if [[ $modified -ne "0" ]]
  then
    echo $(colorize "M:$modified" "yellow")
  else
    echo "M: $modified"
  fi
}

function untracked {
  local untracked=$(git status --porcelain 2>/dev/null| grep "^??" | wc -l)
  if [[ $untracked -ne "0" ]]
  then
    echo $(colorize "U:$untracked" "ltblue")
  else
    echo "U: $untracked"
  fi
}

function git_info {
  local ref=$(git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3-)
  if [ "$ref" != "" ]
  then
    echo "$(set_branch_color $ref) | $(staged)  $(modified)  $(untracked)"
  fi
}

git_info
