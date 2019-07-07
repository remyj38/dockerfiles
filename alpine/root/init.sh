#!/bin/sh
set -e

echo "Setting conf"

touch /config/aria2.session

if [[ ! -e /config/aria2.conf ]]
then
  cp /aria2.conf.default /config/aria2.conf
  secret=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)
  sed -i "s/<password>/$secret/" /config/aria2.conf
  echo "Generated secret to access Aria2: $secret"
fi

echo "[DONE]"

echo "Starting aria2c"

exec aria2c \
    --conf-path=/config/aria2.conf \
  > /dev/stdout \
  2 > /dev/stderr

echo 'Exiting aria2'
