#!/usr/bin/env bash

read askingnode

CLUSTER_STATUS="ok"
NODES=()
while read node;do
  if [[ "$askingnode" != "$node" ]];then
	  NODES+=(galera-$node:4567)
	fi
	status=$(echo "SHOW GLOBAL STATUS LIKE 'wsrep_cluster_status';" \
	  | mysql -u $MYSQL_USER $MYSQL_DATABASE -p$MYSQL_PASSWORD -h "galera-$node"  \
	  | tail -1 \
	  | awk '{print $2}')
	if [[ "$status" != "Primary" ]];then
	  CLUSTER_STATUS="down"
	fi

done < <(docker service ps --filter "desired-state=running" --format "{{.Node}}" ${STACK_NAME}_node)

if [[ "$CLUSTER_STATUS" == "ok" ]];then
  JOIN_NODES=$(echo ${NODES[*]} | tr ' ' ',')
  COMMAND="--wsrep_cluster_address='gcomm://$JOIN_NODES'"
else
  SELECTED_NODE=${NODES[0]}
  if [[ "$SELECTED_NODE" == "$askingnode" ]];then
    COMMAND="--wsrep_new_cluster"
  else
    COMMAND="--wsrep_cluster_address='gcomm://$JOIN_NODES'"
  fi
fi

echo $COMMAND
