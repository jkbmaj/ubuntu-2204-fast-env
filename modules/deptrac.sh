#!/usr/bin/env bash

curl -LS https://github.com/qossmic/deptrac/releases/download/0.15.0/deptrac.phar -o deptrac.phar

chmod +x deptrac.phar
mv deptrac.phar /usr/local/bin/deptrac