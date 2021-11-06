#!/bin/sh -l

TICKET_URL
RELEASE_DESCRIPTION

echo ----------------------------------------------------------------
echo "\e[1m\e[35m release $RELEASE_VERSION"
echo "\e[0m----------------------------------------------------------------"

echo installing npm dependencies

npm i

. ./ci-source/changelog-generator.sh

if [ $? -eq 1 ]; 
    then echo "\e[91m failed to generate CHANGELOG file \033[0m"; exit 1;
fi

echo ----------------------------------------------------------------
echo Creating docker image
echo ----------------------------------------------------------------

docker build --build-arg RELEASE_VERSION="$RELEASE_VERSION" -t release-image:$RELEASE_VERSION .

RELEASE_DESCRIPTION="$RELEASE_DESCRIPTION\nCREATED DOCKER IMAGE version $RELEASE_VERSION"

TICKET_RESPONSE=$(curl -s -H "X-Org-ID: 6461097"\
    -H "Authorization: OAuth $TRACKER_ACCESS_TOKEN"\
    -H "Content-Type: application/json"\
    -d "{\"description\": \"$RELEASE_DESCRIPTION\"}"\
    -X PATCH $TICKET_URL)

if [ $? -eq 0 ]; 
    then echo "\e[92m Docker image build success \033[0m"; 
    else echo "\e[91m failed to build docker image \033[0m"; exit 1;
fi

. ./ci-source/tests-runner.sh

# formatting output - shttps://misc.flogisoft.com/bash/tip_colors_and_formatting

# # скрипт должен создавать запись в реестре релизов (Трекер) 
# # и сохранять туда всю нужную информацию: автор и дата релиза (можно взять из тэга), номер версии, changelog