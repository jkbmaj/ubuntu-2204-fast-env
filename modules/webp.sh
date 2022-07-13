#!/usr/bin/env bash

if ! which webp > /dev/null; then
	apt install --yes webp
fi