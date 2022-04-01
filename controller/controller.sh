#!/usr/bin/env bash

read node

#CLUSTER_STATUS="ok"
#docker service ps --filter "desired-state=running" --format "{{.Node}}" galera-stage_node | while read node;do
  #echo "SHOW GLOBAL STATUS LIKE 'wsrep_%';" | mysql -u $MYSQL_USER $MYSQL_DATABASE -p$MYSQL_PASSWORD -h "galera-$node"
#done

echo "--wsrep_cluster_address='gcomm://'"