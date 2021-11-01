#!/bin/sh -l

echo creating release $RELEASE_VERSION

node ./ci-source/index.js
