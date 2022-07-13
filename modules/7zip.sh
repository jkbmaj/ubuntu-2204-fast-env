#!/usr/bin/env bash

if ! which p7zip > /dev/null; then
	apt install --yes p7zip-full p7zip-rar
fi