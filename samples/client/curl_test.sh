#!/bin/bash
if [ "$1" != "" ]; then
HOST=$1
else
HOST=localhost
fi

function hit_return {
echo "Hit return to continue..."
read
}

clear
echo "-----------------------------------"
echo "Getting a 200 code and accept json."
echo "-----------------------------------"
hit_return
# silent, print response header, descired return header, flush response body
curl -s -D - http://$HOST:8124/200?headers.Content-Type=application/json -o /dev/null

hit_return
clear
echo "-----------------------------------"
echo "Getting a 400 code."
echo "-----------------------------------"
hit_return
curl -s -D - http://$HOST:8124/400 -o /dev/null

hit_return
clear
echo "-----------------------------------"
echo "Getting a 401 code."
echo "-----------------------------------"
hit_return
# request header, method, request data, silent, print response header
curl -H "Content-Type: application/json" -X POST -d '{"username":"xyz","password":"xyz"}' -s -D - http://$HOST:8124/401

echo
