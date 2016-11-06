#!/bin/bash

(
  sleep 10
  git-ssb-web server 0.0.0.0:5000 --public
)&

echo Starting sbot: $HOST
sbot server --host $HOST
