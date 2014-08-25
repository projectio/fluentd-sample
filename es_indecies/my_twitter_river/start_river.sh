#!/bin/sh

source ./config.sh

cmd="curl -XPUT $URL/_river/$INDEX/_meta -d @meta.json"

echo "start twitter river"
echo $cmd
eval $cmd

echo ""
