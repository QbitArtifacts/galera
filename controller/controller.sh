#!/usr/bin/env bash

read askingnode

#CLUSTER_STATUS="ok"
NODES=()
while read node;do
  if [[ "$askingnode" != "$node" ]];then
	  NODES+=($node:4567)
	fi
  #echo "SHOW GLOBAL STATUS LIKE 'wsrep_%';" | mysql -u $MYSQL_USER $MYSQL_DATABASE -p$MYSQL_PASSWORD -h "galera-$node"
done < <(docker service ps --filter "desired-state=running" --format "{{.Node}}" ${STACK_NAME}_node)

JOIN_NODES=$(echo ${NODES[*]} | tr ' ' ',')
COMMAND="--wsrep_cluster_address='gcomm://$JOIN_NODES'"

echo $COMMAND
