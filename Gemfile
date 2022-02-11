source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Default
gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3.11'
gem 'sass-rails', '~> 6.0.0'
gem 'webpacker', '>= 4.0.7'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.9.1'
gem 'bootsnap', '>= 1.4.5', require: false

# App
gem 'devise', '4.7.1'
gem 'faker'
gem 'capistrano', '~> 3.11.1'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-passenger', '~> 0.2.0'
gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
	gem 'rspec-rails'
end

group :test do
	gem 'capybara'
	gem 'factory_bot_rails'
	gem 'simplecov', require: false
	gem 'selenium-webdriver'
	gem 'webmock'
	gem 'webdrivers', '~> 4.0'
end

group :development do
  gem 'web-console', '>= 4.0.1'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
	gem 'guard-rails', require: false
	gem 'guard-rspec', require: false
	gem "better_errors"
  gem "binding_of_caller"
end