#!/usr/bin/env bash

if ! which gparted > /dev/null; then
	apt install --yes gparted
fi