#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

gotpl '/etc/gotpl/config.php.tpl' > "${WEBGRIND_ROOT}/config.php"
