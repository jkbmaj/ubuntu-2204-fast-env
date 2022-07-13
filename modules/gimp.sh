#!/usr/bin/env bash

if ! which gimp > /dev/null; then
	apt install --yes gimp gimp-data-extras
fi