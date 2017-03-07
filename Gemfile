source 'https://rubygems.org'
gem 'rails', '4.2.7.1'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'simple_form', '3.4.0'
gem 'client_side_validations'
# gem 'bootstrap_form'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise', '4.2.0'
gem 'haml', '4.0.7'
gem 'bootswatch-rails'

# immigrant for referential integrity
gem 'immigrant'

# redis for caching
gem 'redis-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'

group :development, :test do
  gem "rspec"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "capybara"
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem 'teaspoon', git: 'git://github.com/modeset/teaspoon.git'
  gem 'teaspoon-jasmine'
  gem 'phantomjs'
  # Rails panel in DevTools
  gem 'meta_request'
  # mass create db:seed
  gem 'ffaker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'pry-rails', '0.3.4'
  gem 'pry-byebug', '3.3.0'
  gem "pry-doc"
  gem 'rails_best_practices'
  gem 'rubocop', require: false
  gem 'brakeman'
  gem 'awesome_print'
  # gem 'rack-mini-profiler'
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor'
end
