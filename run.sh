#!/usr/bin/env bash

if [[ "$(id -u)" -ne 0 ]]; then
    echo -e "\e[31mThis script must be run as root!\e[39m"
    exit 1
fi

set -o pipefail

if [ -z ${1+x} ]; then
  INSTALLATION_PROFILE=$(whiptail --radiolist "Choose what you want to do." \
    10 94 4 \
    "update" "Update system packages" on \
    "mini" "Minimum installation" off \
    "custom" "Choose your favorite packages" off \
    3>&2 2>&1 1>&3)
else
  INSTALLATION_PROFILE="${1}"
fi

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/common.sh"

if [[ "${INSTALLATION_PROFILE}" == "update" ]]; then
    CHOICES="self-update update"

    if which deptrac > /dev/null; then
        CHOICES="${CHOICES} deptrac"
    fi

    if [[ -f "${ROOT_DIR}/bin/PrusaSlicer.AppImage" ]]; then
        CHOICES="${CHOICES} prusa-slicer"
    fi

    date '+%s' > "${ROOT_DIR}/.last_update"
fi

if [[ "${INSTALLATION_PROFILE}" == "mini" ]]; then
    CHOICES="update thunderbird git sublime-text-4 ufw"
fi

if [[ "${INSTALLATION_PROFILE}" == "custom" || "${INSTALLATION_PROFILE}" == "custom-zero" ]]; then
    CHOICES=$(whiptail --checklist "Select the services you want to install." \
        20 83 15 \
        "7zip" "7zip" "off" \
        "blender" "Blender" "off" \
        "brave" "Brave Browser" "off" \
        "chrome" "chrome" "off" \
        "chrome-gnome-shell" "Chrome GNOME Shell integration" "off" \
        "composer" "composer" "off" \
        "composer-test-utils" "composer test utils" "off" \
        "cpufreq" "cpufreq" "off" \
        "deptrac" "Deptrac" "off" \
        "diagnostic-tools" "diagnostic tools" "off" \
        "discord" "Discord" "off" \
        "docker-desktop" "Docker Desktop" "off" \
        "fiezilla" "fiezilla" "off" \
        "firefox" "firefox" "off" \
        "ftpfs" "ftpfs" "off" \
        "fzf" "zsh fzf" "off" \
        "gimp" "gimp" "off" \
        "git" "git" "off" \
        "git-config" "git config" "off" \
        "git-hooks-dir" "Create directory for git hooks" "off" \
        "gnome-tweaks" "Gnome tweaks" "off" \
        "gparted" "gparted" "off" \
        "gpg" "gpg" "off" \
        "gpg-create-key" "gpg create key" "off" \
        "insomnia" "insomnia" "off" \
        "jetbrains-toolbox" "jetbrains toolbox" "off" \
        "kvm-for-android-studio" "kvm for android studio" "off" \
        "libreoffice" "libreoffice" "off" \
        "miro" "Online Whiteboard" "off" \
        "mysql" "mysql" "off" \
        "nautilus-extensions" "nautilus extensions" "off" \
        "network-tools" "network tools" "off" \
        "nfs" "nfs" "off" \
        "nodejs-16" "Node.js 16 LTS" "off" \
        "obs-studio" "OBS Studio" "off" \
        "openvpn-client" "openvpn client" "off" \
        "php8.1-with-extensions" "PHP 8.1 with extensions" "off" \
        "php-set-default" "Set default PHP version" "off" \
        "postgresql" "postgresql" "off" \
        "postman" "postman" "off" \
        "prusa-slicer" "Prusa Slicer" "off" \
        "rkhunter" "rkhunter" "off" \
        "rsync" "rsync" "off" \
        "secure-delete" "secure delete" "off" \
        "shellcheck" "shellcheck" "off" \
        "signal" "Signal" "off" \
        "slack" "slack" "off" \
        "smart-tools" "smart tools" "off" \
        "speedtest" "speedtest" "off" \
        "spotify" "spotify" "off" \
        "ssh-keygen" "ssh keygen" "off" \
        "ssh-server" "ssh server" "off" \
        "sshfs" "sshfs" "off" \
        "swap" "Add SWAP file" "off" \
        "sublime-text-4" "sublime Text 4" "off" \
        "symfony-cli" "symfony cli" "off" \
        "thunderbird" "thunderbird" "off" \
        "tmux" "tmux" "off" \
        "ufw" "ufw" "off" \
        "usb-creator" "USB Creator" "off" \
        "video-processing" "Video apps" "off" \
        "virtualbox" "virtualbox" "off" \
        "vlc" "vlc" "off" \
        "webp" "webp" "off" \
        "whatsapp" "Whatsapp for Chrome/Brave" "off" \
        "yarn" "yarn" "off" \
        "zoom" "zoom" "off" \
        "zsh" "zsh" "off" \
        "zsh-oh-my-zsh" "Oh my ZSH" "off" \
        3>&2 2>&1 1>&3)
fi

if [[ "${CHOICES}" == "" ]]; then
    echo "No packages selected"
    exit 1
fi

apt update

if [[ ! -f "${ROOT_DIR}/.installed" ]]; then
    # shellcheck disable=SC1090
    source "${MODULES_DIR}/update.sh"
    source "${MODULES_DIR}/basic-packages.sh"
    date '+%Y-%m-%d %H:%M:%S' > "${ROOT_DIR}/.installed"
fi

for CHOICE in ${CHOICES}; do
    CHOICE=$(echo "${CHOICE}" | tr --delete '"')
    # shellcheck disable=SC1090
    echo -e "\e[33m======================================== BEGIN: ${CHOICE} ========================================\e[39m"
    # shellcheck disable=SC1090
    source "${MODULES_DIR}/${CHOICE}.sh"
    echo -e "\e[33m======================================== END: ${CHOICE} ========================================\e[39m"
done

if ${SHOULD_REBOOT}; then
    if zenity --question --text="Do you want to reboot your system?"; then
        reboot
    fi
fi
