# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.routes.default_url_options[:host] = "hugocbp-job-hunt-assistant.herokuapp.com"

ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.credentials.sendgrid[:user_name],
  :password => Rails.application.credentials.sendgrid[:password],
  :domain => "hugocbp-job-hunt-assistant.herokuapp.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
}
