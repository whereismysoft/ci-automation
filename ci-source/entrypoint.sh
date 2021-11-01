#!/bin/sh -l

echo ----------------------------------------------------------------
echo "\e[1m\e[35m release $RELEASE_VERSION"
echo "\e[0m----------------------------------------------------------------"

echo generating changelog file

git tag -l --format='%(tag) %(contents)' > README.md

git add README.md

echo commiting change log file

git commit -m "release changelog $RELEASE_VERSION"

echo pushing changelog file to $RELEASE_VERSION

git push origin $RELEASE_VERSION

node ./ci-source/index.js

# https://misc.flogisoft.com/bash/tip_colors_and_formatting