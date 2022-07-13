#!/usr/bin/env bash

ZOOM_FILE="zoom.deb"
wget --output-document="${ZOOM_FILE}" https://zoom.us/client/latest/zoom_amd64.deb
gdebi --non-interactive "${ZOOM_FILE}"
rm "${ZOOM_FILE}"
