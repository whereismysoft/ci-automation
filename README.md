## Структура

- .github/workflows - тут находится инструкция для экшенов
- /ci-source - тут соответственно скрипты (entrypoint.sh входной файл, название остальных файлов отображает их суть)
- /tests/ - тесты

## как запустить экшн
- чтото изменить -> закомитить
- добавить релизный тег git tag -a v[num].[num].[num]
- запушить релизный тег в ветку название которой соответствует версии тега git push origin v[num].[num].[num]
- переходим сюда https://github.com/whereismysoft/ci-automation/actions - должен запуститься экшн

если возникнут проблемы - мой тг @yoGeezers
