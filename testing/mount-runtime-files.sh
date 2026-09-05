#!/usr/bin/env bash
set -euo pipefail

# TODO rewrite to actually be useful ;-)

SRC="/home/myuser/somerepo/teststate.json"
DST="/srv/srvcs/tested-service/state.json"
SVC_USER="tested-service"

# idempotent: unmount first if this was already run
if mountpoint -q "$DST"; then
  umount "$DST"
fi

touch "$DST"
mount --bind "$SRC" "$DST"
setfacl -m "u:${SVC_USER}:rw" "$DST"