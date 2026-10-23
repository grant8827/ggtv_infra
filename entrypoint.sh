#!/bin/sh
set -e
cd /usr/local/srs

conf=conf/srs.conf
if [ -n "$BACKEND_URL" ]; then
  base="${BACKEND_URL%/}/api/hooks/srs"
  hooks="http_hooks { enabled on; on_publish ${base}/on_publish; on_unpublish ${base}/on_unpublish; }"
  sed "s|# @HTTP_HOOKS@|${hooks}|" conf/srs.conf > conf/runtime.conf
  conf=conf/runtime.conf
  echo "Publishing requires the GGTV stream key (hooks: ${base})"
else
  echo "WARNING: BACKEND_URL is not set, so anyone who can reach port 1935 can publish." >&2
fi

exec ./objs/srs -c "$conf"
