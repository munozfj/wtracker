source 'https://rubygems.org'

ruby '2.1.0'

gem 'rails', '4.0.3'

gem 'bootstrap-sass'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'


group :development do
  gem 'rails_layout'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'childprocess'
  gem 'spork'
end

group :doc do
  gem 'sdoc', require: false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end


group :production do
  gem 'pg'
  gem 'rails_12factor'
end