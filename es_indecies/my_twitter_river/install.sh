#!/bin/sh

source ./config.sh

./stop_river.sh

cmd="curl -XDELETE $URL/$INDEX"
echo "delete index"
echo $cmd
eval $cmd
echo ""

cmd="curl -XPUT $URL/$INDEX -d @mappings2.json"

echo "create index"
echo $cmd
eval $cmd
echo ""

./start_river.sh
