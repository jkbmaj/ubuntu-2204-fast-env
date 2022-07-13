#!/usr/bin/env bash

if ! which gnome-tweaks > /dev/null; then
	apt install --yes gnome-tweaks
fi