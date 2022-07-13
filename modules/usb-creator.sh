#!/usr/bin/env bash

if ! which usb-creator-gtk > /dev/null; then
    apt install --yes usb-creator-gtk
fi
