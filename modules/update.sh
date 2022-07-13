#!/usr/bin/env bash

set -o pipefail

apt full-upgrade --yes

snap refresh

if which composer > /dev/null; then
    run_as_user composer global update
fi

apt autoremove --yes
apt autoclean --yes
