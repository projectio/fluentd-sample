#!/bin/sh

source ./config.sh

cmd="curl -XDELETE $URL/_river/$INDEX"

echo "stop twitter river"
echo $cmd
eval $cmd

echo ""
