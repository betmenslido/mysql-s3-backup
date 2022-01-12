#!/bin/sh

set -e

apk update

apk add mariadb-client
apk add build-base
apk add libxml2-dev
apk add curl-dev

rm -rf /var/cache/apk/*
