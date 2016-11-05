#!/bin/bash

(
    echo "sleeping 10s to generate manifest"
    sleep 10
    NODE_ID=`sbot whoami | grep "id" | cut '-d"' -f4`
    echo "node id $NODE_ID"

    echo "lets see if we have existing db..."
    LOG=`sbot logt about --limit 1`

    if [[ -z "${LOG// }" ]]; then

    	echo "new node let's name it"

    	echo "naming $NODE_NAME"
    	sbot publish --type about --about $NODE_ID --name $NODE_NAME

      echo "creating invite"
    	sbot invite.create 1

    else

      echo "seems we already have data"

    fi
)&

echo Starting sbot: $HOST
sbot server --host $HOST
