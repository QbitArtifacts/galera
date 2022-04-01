#!/usr/bin/env bash

if [[ $1 != "" ]];then
  exec "$@"
else
  tcpserver -HR 0.0.0.0 80 ./controller.sh
fi
