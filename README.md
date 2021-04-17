# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Docker

Создание бд, таблиц

* `docker-compose run app rake db:create`
  
Миграции первый раз обязательно, дальше по необходимости
* `docker-compose run app rake db:migrate`
