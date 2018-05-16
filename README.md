# README
This is a discord bot that monitors makemehost.com and reports maps to your discord channels. It creates, edits and deletes the messages.

## System dependencies
* [Ruby](https://www.ruby-lang.org/en/) 2.4.1

## Configuration
Create a .env file with something like
```
TOKEN=ABCDEFG
CLIENT_ID=12345
INTERVAL=2m
HTTP_AUTH_USERNAME=admin
HTTP_AUTH_PASSWORD=adminpassword
```

Install gems

	gem install bundler
	bundle install

Load database migrations

	rails db:migrate

## Start
Start web server
    
    rails s
Goto `localhost:3000/admin` and set up records of maps and keywords that you want to watch

Run makemehost watch schedule

    rake discord

## Run test suite
    rspec spec
    
## Deployment
I do not recommend deploying on heroku since you are scraping a website and also because you need to run a job every 2min which i am not sure heroku supports
