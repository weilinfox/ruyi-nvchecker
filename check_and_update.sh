#!/bin/bash

set -e

if [[ "$(whoami)" == "root" ]]; then
	echo Donnot run with root user, abort
	exit -1
fi

BASE_DIR="$(dirname $(realpath $0))"
OLD_DIR="$(pwd)"

. "$BASE_DIR"/check_commands.sh

cd "$BASE_DIR"
git pull
cd "$OLD_DIR"

LOG_DATE="$(date '+%Y%m%d-%H%M%S')"

if [ -e "$BASE_DIR"/.check_and_update.lock ]; then
	echo Another check_and_update.sh process is running, abort
	exit 0
fi

mkdir -p "$BASE_DIR"/logs/logs

touch "$BASE_DIR"/.check_and_update.lock
"$BASE_DIR"/update.sh 2>&1 | tee "$BASE_DIR"/logs/logs/update_"$LOG_DATE".log
rm "$BASE_DIR"/.check_and_update.lock

