#!/usr/bin/env bash

if ! which firefox > /dev/null; then
	apt install --yes firefox firefox-locale-en firefox-locale-pl
fi