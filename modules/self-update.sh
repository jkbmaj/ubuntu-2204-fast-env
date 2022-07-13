#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."

# shellcheck disable=SC2164
cd "${ROOT_DIR}"

if ! which git > /dev/null; then
    source "${MODULES_DIR}/git.sh"
fi

run_as_user git pull

chown -R "${USER_NAME}". "${ROOT_DIR}"
