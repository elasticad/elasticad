# By placing all of Elasticad's shared dependencies in this file and then loading
# it for each component's Gemfile, we can be sure that we're only testing just
# the one component of Elasticad.
source 'https://rubygems.org'

gem 'paperclip', '~> 3.4.1' # '~> 3.5.2'
gem 'slim-rails'
# gem 'mongoid', '~> 3.1.0'
# gem 'mime-types'

if ENV['LOCAL_GIT_REPO']
  gem 'mongoid', path: '/development/ruby/workspaces/mongoid/mongoid'
  gem 'validates_formatting_of', path: '/development/ruby/libs/validates_formatting_of'
else
  gem 'mongoid', github: 'mongoid/mongoid', branch: :master
  gem 'validates_formatting_of', github: 'hbakhtiyor/validates_formatting_of', branch: 'auto-include-in-mongoid'
end

gem 'coveralls', require: false

# gem 'moped'

group :production do
end

group :development do
  # Code metrics

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
  gem 'guard-spork', path: '/development/ruby/workspaces/elasticad/guard-spork' if ENV['LOCAL_GIT_REPO']
  # gem 'spork-rails', '~> 4.0'
  gem 'capybara'
  # gem 'fabrication'
  gem 'factory_girl_rails'
  # gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rb-inotify', '~> 0.9'
end

group :development, :test do
  # bug: already activated coderay 1.1.0
  # gem 'ruby-debug'
  gem 'pry-rails'
  # gem 'pry-nav'
end

# gemspec