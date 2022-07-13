#!/usr/bin/env bash

if ! which virtualbox > /dev/null; then
    apt install --yes virtualbox virtualbox-ext-pack virtualbox-dkms
fi

if ! groups | grep --quiet vboxusers; then
    adduser "${USER_NAME}" vboxusers
fi
