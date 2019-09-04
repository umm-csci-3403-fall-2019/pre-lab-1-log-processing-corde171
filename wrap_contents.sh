#!/bin/bash
CONTENTS=$1
SPEC=$2
NAME_OUT=$3
cat "${SPEC}_header.html" "$CONTENTS" "${SPEC}_footer.html" > "$NAME_OUT"
