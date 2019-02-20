# Tech Job Search Assistant

A webapplication built with Ruby on Rails 6.0.0.beta1 that assists with job
hunting opportunities.

The app allows the user to create listings with the technologies required,
office location and description and it tries to find the Glassdoor rate for the
office, displays the map and allows the user to set the status of his/her
application to the position.

## Demo

Demo app live at [Heroku](http://hugocbp-job-search-assistant.herokuapp.com)
(might take a while to start for the first time).

## Instructions

1. Download
2. Run `bundle`
3. Run `yarn install`
4. Start Postgres server
5. Run `rails db:migrate`
6. (OPTIONAL) Seed the database with `rails db:seed`
7. Start the server with `rails s`
8. Access the application at `http://localhost:3000`

## Tests

To test, run `bundle exec rspec` on the root directory.

Code coverage can be seen by opening `coverage/index.html` that is generated
after a run of all the specs at least once.
