#!/usr/bin/env bash

if ! which composer > /dev/null; then
    source "${MODULES_DIR}/composer.sh"
fi

run_as_user composer global require \
    phpstan/phpstan \
    phpunit/phpunit \
    squizlabs/php_codesniffer
