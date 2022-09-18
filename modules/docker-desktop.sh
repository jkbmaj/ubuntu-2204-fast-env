#!/usr/bin/env bash

set -e

DEB_FILE="docker-desktop.deb"

curl -L "https://desktop.docker.com/linux/main/amd64/docker-desktop-4.12.0-amd64.deb" -o "${DEB_FILE}"
gdebi --non-interactive "${DEB_FILE}"
rm "${DEB_FILE}"
