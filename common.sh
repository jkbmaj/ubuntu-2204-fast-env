#!/usr/bin/env bash
set -o pipefail

SHOULD_REBOOT=false
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODULES_DIR="${ROOT_DIR}/modules"
USER_NAME="$(logname)"
USER_HOME="$(eval echo ~"${USER_NAME}")"

run_as_user() {
    sudo -H -u "${USER_NAME}" PWD=$(pwd) "${@}"
}

text_input() {
    zenity --entry --title="Ubuntu Env Installer" --text="${1}"
}

password_input() {
    zenity --password --title="Ubuntu Env Installer" --text="${1}"
}

### BEGIN System checker
CONFIGURATOR_VERSION="22.04"
UBUNTU_VERSION=$(lsb_release --release --short)

if [[ "${UBUNTU_VERSION}" != "${CONFIGURATOR_VERSION}" ]]; then
    echo -e "\e[31mERROR: This environment installer is only for Ubuntu ${CONFIGURATOR_VERSION} LTS\e[39m"
    exit 1
fi
### END System checker
