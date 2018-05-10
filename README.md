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

# README

## System dependencies
* [Ruby](https://www.ruby-lang.org/en/) 2.4.1
* POSTGRESQL

## Configuration
	  gem install bundler
    bundle install
    rails db:migrate

## Start
Start web server
    
    rails s
Goto `localhost:3000/admin` and set up records of maps and keywords that you want to watch
Run makemehost watch schedule

    rake :discord

## Run test suite
    rspec spec
    
## Deployment
I do not recommend deploying on heroku since you are scraping a website and also because you need to run a job every 2min which i am not sure heroku supports
