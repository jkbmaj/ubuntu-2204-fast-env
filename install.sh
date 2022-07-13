#!/usr/bin/env bash

set -o pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

while ! echo "${FAST_SETUP_UPDATE_PERIOD}" | grep -qE '^[0-9]+$'; do
    FAST_SETUP_UPDATE_PERIOD=$(text_input "Set the update check period [in days]")
done

for FILE in ~/.zshrc ~/.bashrc; do
  if ! grep --quiet 'FAST_SETUP_UPDATE_PERIOD' "${FILE}"; then
      echo -e "\nFAST_SETUP_UPDATE_PERIOD=${FAST_SETUP_UPDATE_PERIOD}\n${ROOT_DIR}/check.sh\nalias fastenv='sudo ${ROOT_DIR}/run.sh'\n" | tee --append "${FILE}"  > /dev/null
  fi
done