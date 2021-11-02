# #!/bin/sh -l

# # скрипт должен создавать запись в реестре релизов (Трекер) 
# # и сохранять туда всю нужную информацию: автор и дата релиза (можно взять из тэга), номер версии, changelog

echo ----------------------------------------------------------------
echo "\e[1m\e[35m release $RELEASE_VERSION"
echo "\e[0m----------------------------------------------------------------"

sh ./ci-source/changelog-generator.sh

if [ $? -eq 1 ]; 
    then echo "\e[91m failed to generate CHANGELOG file \033[0m"; exit 1;
fi

# node ./ci-source/index.js

# formatting output - shttps://misc.flogisoft.com/bash/tip_colors_and_formatting