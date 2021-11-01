#!/bin/sh -l

echo lets start
echo $NODE_AUTH_TOKEN

node ./ci-source/index.js
