# Job Hunt Assistant

Job Hunt Assistant is a webapp built to help with the search for a new job by
providing new and quick ways to glance at the relevant information and take the
necessary actions.

<p align="center">
  <img src="app/assets/images/jha-demo.gif"width="70%"align="center" >
</p>

## Features

- **Dashboard** that shows the relevant information and statistics about the job
  hunting effort, providing a quick overview of where you stand.

- **Kanban view** of current tracked opportunities, allowing quick updates on
  the status of each lead.

- **Company info** with ratings and maps, which are both automatically shown,
  and a list of technologies used at the company to help chosing the right place
  for you.

## Demo

Demo app live at [Heroku](http://hugocbp-job-hunt-assistant.herokuapp.com)
(might take a while to start for the first time).

## Technical Specifications

- Ruby 2.6.1
- Rails 6.0.0.beta1
- Bootstrap 4
- RSpec 3
- Devise
- Capistrano (deploy on test Vagrant box with Ubuntu 18.04.2 LTS)

## Instructions

1. Download
2. Run `bundle`
3. Start Postgres server
4. Run `rails db:migrate`
5. (OPTIONAL) Seed the database with `rails db:seed`
6. Start the server with `rails s`
7. Access the application at `http://localhost:3000`

## Tests

To test, run `bundle exec rspec` on the root directory.

Code coverage can be seen by opening `coverage/index.html` that is generated
after a run of all the specs at least once.
