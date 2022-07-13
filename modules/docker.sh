#!/usr/bin/env bash

if ! which docker > /dev/null; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt update
    apt install --yes docker-ce

fi

usermod --append --groups docker "${USER_NAME}"
systemctl enable docker
service docker restart

echo -e "\e[31mWARNING!!! Before you use the docker command without \"sudo\", please restart the system!\e[39m"

SHOULD_REBOOT=true
