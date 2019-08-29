#!/usr/bin/env bash
set -e

DENO_DB="https://raw.githubusercontent.com/denoland/registry/master/src/database.json"

main() {
  while IFS=$'\t' read -r name repo; do
    if [ -e "${name}" ]; then
      pushd "${name}" >/dev/null
      echo "### UPDATING ${name}"
      git fetch -p
      git pull
      popd >/dev/null
    else
      echo "### CLONING ${name}"
      git clone "${repo}" "${name}" || true
    fi
    # echo "${name} | ${repo}"
  done < <(curl -s "${DENO_DB}" | jq -r 'keys[] as $k | [$k, .[$k].repo] | @tsv')
}

main

