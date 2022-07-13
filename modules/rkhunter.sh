#!/usr/bin/env bash

if ! which rkhunter > /dev/null; then
	apt install --yes --no-install-recommends rkhunter
fi