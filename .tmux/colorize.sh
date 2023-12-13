red="\033[38;5;160m"
yellow="\033[38;5;220m"
orange="\033[38;5;208m"
green="\033[38;5;34m"
end="\033[0m"

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
    # Wrap str in a red
    echo "$red$1$end"
  else
    # Just send back the string unadorned
    echo "$1"
  fi
}

colorize "$1" "$2"
