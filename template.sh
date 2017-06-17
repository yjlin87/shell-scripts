#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

#/ Usage:
#/ Description:
#/ Examples:
#/ Options:
#/   --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage

readonly LOG_FILE="/tmp/$(basename "$0").log"
info()    { echo "[INFO]    $@" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo "[WARNING] $@" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo "[ERROR]   $@" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo "[FATAL]   $@" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

cleanup() {
    # Remove temporary files
    # Restart services
    # ...
    echo "cleanup"
}

foo() {
	echo "some cool function"
}

if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    trap cleanup EXIT
    # Script goes here
    # ...
    echo "hello world"
    # actually run it
    foo "$@"
TEMP_DIR=$(mktemp -d ${TMPDIR-/tmp}/cephtool.XXX)
# trap "rm -fr $TEMP_DIR" 0
echo ${TEMP_DIR}
TMPFILE=$(mktemp $TEMP_DIR/test_invalid.XXX)
echo ${TMPFILE}
fi

