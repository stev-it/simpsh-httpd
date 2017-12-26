#! /bin/bash

. ./config.sh
echo "Listening at Port: $PORT"
if [ "$1" = "-d" -o "$1" = "--daemon" ]; then
  setsid socat TCP-LISTEN:$PORT,reuseaddr,fork SYSTEM:"./main.sh" > /dev/null 2>&1 &
else
  socat TCP-LISTEN:$PORT,reuseaddr,fork SYSTEM:"./main.sh" &
  echo $! > /run/lock/simpsh-httpd.lock
  fg
fi
