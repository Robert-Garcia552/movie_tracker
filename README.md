# Movie Tracker

App that allows users to track movies they have seen, favorite the ones they enjoyed, and write reviews.

### Author

Robert Garcia

### Upcoming Features

This project is a work in progress. Here are items being worked on currently:

* Users will be able to review movies.
* Forgot Password mailer.

### Dependencies

* Ruby 2.6.3
* PostgreSQL

### Getting Started Locally

1. git clone
2. bundle install
3. rails db:migrate
4. rails db:seed - In order to get movies seeded into database you'll need an API Key from https://www.themoviedb.org/documentation/api create a `.env` file with `ENV["MOVIES_KEY"]=your_api_key`.
5. rails s

### Test Suite

Coming Soon
