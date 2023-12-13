#!/bin/bash

os="$(uname)"

if [[ "$os" == "Linux" ]]; then
    echo "$(cat /proc/loadavg | cut -d\  -f 1-3)"
else
    # OS X
    echo "$(sysctl -n vm.loadavg | cut -c 3-16)"
fi
