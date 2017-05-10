#!/usr/bin/env bash
set -e

MANPAGE_TARGET=${1:-./man/man}

# get into this script's directory
cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

for FILE in *.md; do
	base="$(basename "$FILE")"
	name="${base%.md}"
	num="${name##*.}"
	if [ -z "$num" -o "$name" = "$num" ]; then
		# skip files that aren't of the format xxxx.N.md (like README.md)
		continue
	fi
	mkdir -p "$MANPAGE_TARGET/man${num}"
	$GOPATH/bin/go-md2man -in "$FILE" -out "$MANPAGE_TARGET/man${num}/${name}"
done
