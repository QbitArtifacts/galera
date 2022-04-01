#!/usr/bin/env bash

nodes=$(echo "list_nodes" | nc controller 80)

mysqld --user=root --wsrep-cluster-address="gcomm://$nodes:4567"