﻿source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use sqlite3 as the database for Active Record gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
gem 'bcrypt-ruby'
gem 'jquery-rails'
#gem 'jquery', '~> 0.0.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes # gem 'therubyracer', platforms: :ruby
gem 'tzinfo-data'
# Use CoffeeScript for .coffee assets and views gem 'coffee-rails', '~> 4.2'
gem 'coffee-script-source', '1.8.0'
gem 'coffee-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production # gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
#gem 'wdm', '>= 0.1.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'will_paginate', '~> 3.1'
gem 'bootstrap-will_paginate'
gem 'bootstrap-sass'  
gem 'faker'
  
group :development, :test do
  
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
  
  
end
group :test do
gem 'cucumber-rails'
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end
group :production do
  gem 'pg', '~> 0.21.0'
  gem 'rails_12factor'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
