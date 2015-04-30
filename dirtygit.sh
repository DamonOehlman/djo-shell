#!/usr/bin/env bash

# bootstrap the bash require environment
DIRTY=0

for dir in *; do
  if [ -d "${dir}" ]; then
    pushd "$dir" > /dev/null

    if [ -d .git ]; then
      if [ `git status --porcelain | wc -c` -ne "0" ]; then
        echo $dir
        DIRTY=1
      fi
    fi

    popd > /dev/null
  fi
done

exit $DIRTY
