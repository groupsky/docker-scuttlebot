#!/bin/bash

NODE_NAME=${NODE_NAME:-hackafe}

echo Starting sbot: $HOST
(
    echo "sleeping 10s to generate manifest"; 
    sleep 10; 
    NODE_ID=`sbot whoami | grep "id" | cut '-d"' -f4`
    echo "node id $NODE_ID"
    echo "naming $NODE_NAME"
    sbot publish --type about --about $NODE_ID --name $NODE_NAME
    sbot invite.create 1
)&
sbot server --host $HOST
