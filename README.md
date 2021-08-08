# README

Tuitter is a demo twitter clone app


## System dependencies

* PostgreSQL
* Ruby 2.7
* Yarn
* NodeJS

## Configuration

You need to setup database connection with an ENV variable 

```sh
DATABASE_URL="postgres://myuser:mypass@localhost/somedatabase"
```

## Database creation

To setup db run rake commands 

```sh
$ rails db:setup
```

```sh
$ rails db:migrate
```

## How to run the test suite

RSpec as test suite

```sh
$ rspec 
```

## Deployment using Heroku

Download and install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-command-line).

If you haven't already, log in to your Heroku account and follow the prompts to create a new SSH public key.

```sh
$ heroku login
```

Then let's create a new Heroku app

```sh
$ heroku create APP_NAME
```

Then add a database 
```sh
$ heroku addons:create heroku-postgresql:hobby-dev
```

Then push code to server
```sh
$ git push heroku master
```

