#!/usr/bin/env sh
set -e

echo "ARGS:      $@"

echo "USER_GID: "${USER_GID:-9001}
echo "USER_UID: "${USER_UID:-9001}

# generate host keys if not present
ssh-keygen -A

# do not detach (-D), log to stderr (-e)
exec /usr/sbin/sshd -D -e &

cd /vpn
exec openconnect "$@"
