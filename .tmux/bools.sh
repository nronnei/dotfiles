function set_branch_color {
  if [ $DIRTY = "true" ] && [ $STAGED != "true" ]
  then
    # Wrap str in an red
    echo "no"
  elif [ $DIRTY = "true" ] && [ $STAGED = "true" ]
  then
    # Wrap str in an orange
    echo "kinda"
  elif [ $DIRTY != "true" ] && [ $STAGED = "true" ]
  then
    # Wrap str in a yellow
    echo "mostly"
  else
    # Wrap str in a green
    echo "yarp"
  fi
}

function set_true {
  $1=true
}

function set_false {
  $1=false
}


DIRTY=false
STAGED=false

set_branch_color

set_true DIRTY

set_branch_color

set_true STAGED

set_branch_color

set_true DIRTY

set_branch_color
