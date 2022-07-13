#!/usr/bin/env bash

if ! which tmux > /dev/null; then
	apt install --yes tmux
fi