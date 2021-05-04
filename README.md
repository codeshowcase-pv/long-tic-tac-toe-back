# Запуск сервера в докере
1. На основе `.env.example` создать `.env`
2. Запустить контейнер "раннер", внутри него установить гемы и создать базу
```
docker-compose run runner
bundle config path 'vendor/bundle' --local
bundle
rails db:prepare
exit
```
3. Запустить сервер `docker-compose up server`
