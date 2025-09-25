#!/bin/bash
YAZI_ZIP_PASS="changeme"
first_file="$1"
parent_dir=$(dirname "$first_file")
cd "$parent_dir"

basenames=()
for file in "$@"; do
  basenames+=($(basename "$file"))
done

zip -r -P "$YAZI_ZIP_PASS" "selected_files.zip" "${basenames[@]}"
