#!/usr/bin/env bash
#
# Generate man pages for docker/docker
#

set -eu

MANPAGE_TARGET=${1:-./man/man}

mkdir -p "$MANPAGE_TARGET/man1"

# Generate man pages from cobra commands
echo "Attempting to compile generate.go"
go build -o /tmp/gen-manpages ./man
echo "Compiled generate.go, attempting to run binary with a target: $MANPAGE_TARGET"
/tmp/gen-manpages --root . --target "$MANPAGE_TARGET/man1"

# Generate legacy pages from markdown
./man/md2man-all.sh "$MANPAGE_TARGET"
