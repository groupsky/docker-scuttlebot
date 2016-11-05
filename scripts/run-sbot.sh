#!/bin/bash

(
  echo "sleeping 10s to generate manifest"
  sleep 10

  NODE_ID=`sbot whoami | grep "id" | cut '-d"' -f4`
  echo "node id $NODE_ID"

  echo "lets see if we have existing db..."
  LOG=`sbot logt about | grep $NODE_ID`

  if [[ -z "${LOG// }${NODE_NAME// }" ]]; then
    echo "new node let's name it"

    echo "naming $NODE_NAME"
    sbot publish --type about --about $NODE_ID --name $NODE_NAME
  elif [[ -z "${LOG// }" ]]; then
    echo "existing node"
  elif [[ -z "${NODE_NAME// }" ]]; then
    echo "no NODE_NAME provided"
  else
    echo "already set"
  fi

  echo "creating invite"
  sbot invite.create 1
)&

echo Starting sbot: $HOST
sbot server --host $HOST
