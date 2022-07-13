#!/usr/bin/env bash

if ! which filezilla > /dev/null; then
	apt install --yes filezilla
fi