#!/bin/sh

BASEDIR=`dirname -- "$0"` || exit $?
BASEDIR=`realpath -- "${BASEDIR}"` || exit $?

. "${BASEDIR}/update.conf"

set -xe
set -o pipefail

cat -- "${BASEDIR}/README.md.template" |\
    sed -E \
        -e "s/%%MAJOR%%/${MAJOR}/g" \
        -e "s/%%MINOR%%/${MINOR}/g" \
        -e "s/%%PATCH%%/${PATCH}/g" > "${BASEDIR}/../README.md"
