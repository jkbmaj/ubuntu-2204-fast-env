#!/usr/bin/env bash

set -e

if ! which docker > /dev/null; then
    source "${MODULES_DIR}/docker.sh"
fi

DEB_FILE="docker-desktop.deb"

curl -L "https://desktop.docker.com/linux/main/amd64/docker-desktop-4.11.1-amd64.deb" -o "${DEB_FILE}"
gdebi --non-interactive "${DEB_FILE}"
rm "${DEB_FILE}"
