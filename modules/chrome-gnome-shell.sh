#!/usr/bin/env bash
if ! which chrome-gnome-shell > /dev/null; then
    apt install --yes chrome-gnome-shell
fi