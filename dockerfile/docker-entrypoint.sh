#! /bin/sh
RUNUSER_UID="${RUNUSER_UID:-1000}"
RUNUSER_HOME="${RUNUSER_HOME:-/home/runuser}"
#set -ux
if [ -x /usr/sbin/useradd ]; then
  useradd -s /bin/false --no-create-home --home-dir "$RUNUSER_HOME" -u $RUNUSER_UID runuser
else
  adduser -s /bin/false -D -h $RUNUSER_HOME -H -u $RUNUSER_UID runuser
fi
exec gosu runuser "$@"