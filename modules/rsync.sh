#!/usr/bin/env bash

if ! which rsync > /dev/null; then
	apt install --yes rsync
fi