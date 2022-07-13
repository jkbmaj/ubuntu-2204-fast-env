#!/usr/bin/env bash

if ! which vlc > /dev/null; then
	apt install --yes vlc
fi