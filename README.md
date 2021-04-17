## Docker

Создание бд, таблиц

* `docker-compose run app rake db:create`
  
Миграции первый раз обязательно, дальше по необходимости
* `docker-compose run app rake db:migrate`
