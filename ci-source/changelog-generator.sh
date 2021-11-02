#!/bin/sh -l

echo generating changelog file

git remote set-url origin https://github.com/whereismysoft/ci-automation.git

git config user.name $COMMITTER_NAME
git config user.email $COMMITTER_EMAIL

git tag -l --format='%(tag) %(contents)' > CHANGELOG.md

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

curl -H "X-Org-ID: 6461097"\
    -H "Authorization: OAuth AQAAAAA5vX0pAAd6FdJlJbuqckIEifc2pSLKXr4"\
    -H "Content-Type: application/json"\
    -d "{\"summary\": \"release $RELEASE_VERSION\",\"queue\": {\"id\": \"7\",\"key\": \"TMP\"},\"description\": \"release $RELEASE_VERSION\"}"\
    -X POST https://api.tracker.yandex.net/v2/issues/

if [ $? -eq 0 ]; 
    then echo "\e[92m tracker ticket successfully created \033[0m"; 
    else echo "\e[91m failed request to tracker \033[0m"; exit 1;
fi

# Host: https://api.tracker.yandex.net
# headers
# Authorization: Bearer <ваш IAM-TOKEN>
# ya tracker X-Org-ID: = 6461097