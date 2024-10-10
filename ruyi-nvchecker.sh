#!/bin/bash

SOURCE_DIR="$(dirname $(realpath $0))"

mkdir -p "$SOURCE_DIR"/logs

PYTHONPATH="$SOURCE_DIR" nvchecker $@
