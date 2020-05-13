#!/bin/bash

#
# This script should be run from the project root
# e.g. ./contrib/deb/build.sh
#
set -e
fpm -n pktd-linux-amd64 -s dir -t deb -v "$(./bin/pktctl --version | sed 's/.* version //' | tr -d '\n')" ./bin