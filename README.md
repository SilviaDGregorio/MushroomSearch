# README

## How to install
* Install ruby +rails

    https://gorails.com/setup/ubuntu/19.10
* Install postgresql
```
$ sudo apt update
```
```
$ sudo apt install postgresql-11 libpq-dev
```
* Postgres connection configuration:
```
sudo -u postgres createuser postgres -s

# If you would like to set a password for the user, you can do the following
sudo -u postgres psql
postgres=# \password postgres

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