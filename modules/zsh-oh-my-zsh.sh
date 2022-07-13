#!/usr/bin/env bash

RC_FILE="${USER_HOME}/.zshrc"
RC_FILE_BACKUP="${RC_FILE}-backup"
OH_DIR="${USER_HOME}/.oh-my-zsh"

if [[ ! -d "${OH_DIR}" ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git "${OH_DIR}"
    chown -R "${USER_NAME}". "${OH_DIR}"

    run_as_user mv "${RC_FILE}" "${RC_FILE_BACKUP}"
    run_as_user cp "${USER_HOME}/.oh-my-zsh/templates/zshrc.zsh-template" "${RC_FILE}"
    run_as_user cat "${RC_FILE_BACKUP}" >> "${RC_FILE}"
    rm "${RC_FILE_BACKUP}"
fi
