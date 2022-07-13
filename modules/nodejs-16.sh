#!/usr/bin/env bash

if ! which node > /dev/null; then
    curl --silent --location https://deb.nodesource.com/setup_16.x | bash -
    apt install --yes gcc g++ make nodejs
fi
