#!/bin/sh -l

echo generating changelog file

CHANGE_LOG_INFO=$(git tag -l --sort=v:refname --format='%(tag) %(contents)' | sed '/^[[:space:]]*$/d')
RELEASE_DESCRIPTION=$(echo "$CHANGE_LOG_INFO" | tail -n1)

echo "$CHANGE_LOG_INFO" | awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }' > CHANGELOG.md

if [ $? -eq 0 ]; 
    then echo "\e[92m successfully created CHANGELOG file \033[0m";
    else echo "\e[91m failed to create CHANGELOG file \033[0m"; exit 1; 
fi

git add CHANGELOG.md

echo commiting changelog file

git commit -m "release changelog $RELEASE_VERSION"

echo pushing changelog file to $RELEASE_VERSION

git push origin $RELEASE_VERSION

if [ $? -eq 0 ]; 
    then echo "\e[92m changelog file successfully added to repository \033[0m"; 
    else echo "\e[91m failed to push CHANGELOG file \033[0m"; exit 1;
fi

export TICKET_URL=$(curl -s -H "X-Org-ID: 6461097"\
    -H "Authorization: OAuth $TRACKER_ACCESS_TOKEN"\
    -H "Content-Type: application/json"\
    -d "{\"summary\": \"release $RELEASE_VERSION\",\"queue\": {\"id\": \"7\",\"key\": \"TMP\"},\"description\": \"$RELEASE_DESCRIPTION\"}"\
    -X POST https://api.tracker.yandex.net/v2/issues/ | grep -oP '(?<=self\":\")[a-zA-Z-:./0-9]*(?=\",)' | head -1)

echo $TICKET_URL

# if no ticket url
if [ -z $TICKET_URL ]; 
    then echo "\e[91m request to tracker is failed  \033[0m"; exit 1;
    else echo "\e[92m tracker ticket successfully created \033[0m"; 
fi

# awk '/iamToken/ { gsub(/[,"]/, " "); print $4}')

