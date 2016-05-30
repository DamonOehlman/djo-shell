#!/usr/bin/env bash
getopts ":r:" RECURSE

for dir in *; do
  if [ -d "${dir}" ]; then
    pushd "$dir" > /dev/null

    if [ -e package.json ] && [ ! -f .npm-resync-fail ]; then
      echo "reinstalling packages with npm for: ${dir}"
      rm -rf node_modules

      # install node modules and cache aggressively as per discussion
      # https://github.com/nolanlawson/local-npm/pull/122#issue-154909382
      npm install --cache-min 99999999

      # if npm failed, then abort
      if [ $? -ne 0 ]; then
        touch "${dir}/.npm-resync-fail"
      fi
    elif [ "$RECURSE" = ":" ]; then
     npm-all-the-things -r
    fi

    popd > /dev/null
  fi
done
