
# README
## Heroku
    https://mushroomsearch.herokuapp.com/
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
$ rails db:create
$ rails db:migrate
$ rails db:migrate RAILS_ENV=test
```

* Run Aplication
```
$ rails s
Go to -> http://localhost:3000/mushrooms/import (To import the data to the DB only one time)

```

* Run tests
```
$ rspec
```

# Info

I created an application to search mushrooms using postgres as the DB.

I didn't create indexes in the database for each column because with this amount of data I couldn't see a big enough impact.

To run the application you must have the DB running.

# Future improvements

I should insert paginate because the loading of the table in the view is too slow.

I should find a way to avoid repeating the filters and the f.selects in the view for each filter.
