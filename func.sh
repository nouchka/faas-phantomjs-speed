#!/bin/bash

set -- "${1:-$(</dev/stdin)}" "${@:2}"

main() {
  check_args "$@"

  local image=$1
  phantomjs /usr/local/share/loadspeed.js $1
}

check_args() {
  if (($# != 1)); then
    echo "Error:
    Two arguments must be provided - $# provided.
  
    Usage:
      ./get-image-config.sh <image> <tag>
      
Aborting."
    exit 1
  fi
}

main $1
