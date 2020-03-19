# README

## How to install

* Install postgresql
```
$ sudo apt update
```
```
$ sudo apt install postgresql postgresql-contrib libpq-dev
```
* Postgres connection configuration:
```
username: postgres
password: postgres
```
* Create db

```
$ rake db:create
$ rake db:migrate
$ rake db:migrate RAILS_ENV=test
```

* Run Aplication
```
$ rails s
Go to -> http://localhost:3000/mushrooms/import (To import the data to the DB)

```

* Run tests
```
$ rspec
```