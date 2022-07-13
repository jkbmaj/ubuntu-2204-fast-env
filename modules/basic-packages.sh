#!/usr/bin/env bash

set -o pipefail

apt install --yes gdebi \
    curl \
    wget \
    jq \
    zenity \
    rng-tools \
    xclip \
    gawk \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg-agent