#!/bin/bash

(
  echo "sleeping 10s to generate manifest"
  sleep 10

  NODE_ID=`sbot whoami | grep "id" | cut '-d"' -f4`
  echo "node id $NODE_ID"

  echo "lets see if we have existing db..."
  LOG=`sbot logt about | grep $NODE_ID`

  if [[ -z "${LOG// }" && ! -z "${HOST// }" ]]; then
    echo "new node let's name it"

    echo "naming $HOST"
    sbot publish --type about --about $NODE_ID --name $HOST
  elif [[ ! -z "${LOG// }" ]]; then
    echo "existing node"
  elif [[ -z "${HOST// }" ]]; then
    echo "no HOST provided"
  else
    echo "already set"
  fi

  echo "creating invite"
  sbot invite.create 1
)&

echo Starting sbot: $HOST
sbot server --host $HOST
