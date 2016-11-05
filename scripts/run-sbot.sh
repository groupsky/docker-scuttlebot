#!/bin/bash
echo Starting sbot: $HOST
(echo "sleeping 10s to generate manifest"; sleep 10; sbot whoami)&
sbot server --host $HOST
