# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

## System dependencies

Tuitter requires PostgreSQL to run.

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

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


* ...
