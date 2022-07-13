#!/usr/bin/env bash

set -o pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

if [[ -z "${UPDATE_PERIOD}" ]]; then
  FAST_SETUP_UPDATE_PERIOD=7
fi

if [[ ! -f "${ROOT_DIR}/.last_update" || "$((($(date +%s) - $(cat "${ROOT_DIR}/.last_update")) / 86400))" -ge "${FAST_SETUP_UPDATE_PERIOD}" ]] ; then
    echo 'Update your system or press [CTRL] + C'
    sudo "${ROOT_DIR}/run.sh" update
fi
