#!/bin/bash

set -e

BASE_DIR="$(dirname $(realpath $0))"
OLD_DIR="$(pwd)"

cd "$BASE_DIR"

[ -d ./config ]

for c in `ls config/*.toml`; do
	./ruyi-nvchecker.sh -c "$c"
done

cd "$OLD_DIR"

