#!/bin/bash
echo Starting sbot: $HOST
sbot whoami
sbot server --host $HOST
