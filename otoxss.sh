#!/bin/bash

payload_file="payloads.txt"
url_file="urls.txt"

while read payload; do
  while read url; do
    response=$(curl -s "$url$payload")
    if echo "$response" | grep -q "$payload"; then
      echo "Payload found in $url$payload"
    else
      echo "Payload not found in $url$payload"
    fi
  done < "$url_file"
done < "$payload_file"
