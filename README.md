## Структура

- .github/workflows - тут находится инструкция для экшенов (там же определены некоторые глобальные переменные)
- /ci-source - тут соответственно скрипты (entrypoint.sh входной файл, название остальных файлов отображает их суть)
- /tests/ - тесты

## как запустить экшн

- чтото изменить -> закомитить
- добавить релизный тег git tag -a v[num].[num].[num] -m "[message]"
- запушить релизный тег в ветку название которой соответствует версии тега git push origin v[num].[num].[num]
- переходим сюда https://github.com/whereismysoft/ci-automation/actions - должен запуститься экшн
- в результате должен сформироваться в трекере тикет с описанием и changelog файл

если возникнут проблемы - мой тг @yoGeezers
