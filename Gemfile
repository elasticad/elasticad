source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'slim-rails'
# gem 'mongoid', '~> 3.1.0'

if ENV['LOCAL_GIT_REPO']
  gem 'mongoid', path: '../../mongoid/mongoid'
else
  gem 'mongoid', github: 'mongoid/mongoid', branch: :master
end


gem 'validates_formatting_of'
# gem 'moped'

group :production do
end

group :development do
  # Code metrics

  gem 'coveralls', require: false
  # A static analysis security vulnerability scanner for Ruby on Rails applications
  # gem 'brakeman', :require => false
  # gem 'simplecov'
  # Code quality threshold checking as part of your build
  # gem 'cane'
  # A robust Ruby code analyzer, based on the community Ruby style guide
  gem 'rubocop', require: false
  gem 'guard-rubocop'
end

group :test do
  # gem 'shoulda-matchers'
  # gem 'mocha'
  gem 'rspec-rails'
  gem 'mongoid-rspec'
  gem 'guard-rspec', require: false
  gem 'guard-cucumber', require: false
  gem 'guard-spork', path: '../guard-spork' if ENV['LOCAL_GIT_REPO']
  gem 'spork-rails', '~> 4.0'
  gem 'capybara'
  # gem 'fabrication'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rb-inotify', '~> 0.9'
end

group :development, :test do
  # gem 'ruby-debug'
  gem 'pry-rails'
  gem 'pry-nav'
end