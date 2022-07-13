#!/usr/bin/env bash

if ! which git > /dev/null; then
	apt install --yes git
fi