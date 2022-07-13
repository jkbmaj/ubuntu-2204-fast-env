#!/usr/bin/env bash

if ! which gpg > /dev/null; then
	apt install --yes gpa gpg
fi