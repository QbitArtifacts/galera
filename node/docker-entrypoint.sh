#!/usr/bin/env bash

command=$(echo $HOSTNAME | nc controller 80)

mysqld --user=root $command