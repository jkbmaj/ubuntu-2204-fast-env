#!/usr/bin/env bash

if ! which ufw > /dev/null; then
	apt install --yes ufw
fi

ufw enable
