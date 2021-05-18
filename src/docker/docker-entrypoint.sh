#!/bin/bash -e

cd /opt

exec java \
  -Djava.security.egd=file:/dev/./urandom \
  -Duser.timezone="Asia/Shanghai" \
  -Duser.language="zh" \
  -Duser.country="CN" \
  -Djava.io.tmpdir=/var/tmp/ \
  org.springframework.boot.loader.JarLauncher \
  --spring.pid.file=/opt/pid \
  "$@"

exit 0
