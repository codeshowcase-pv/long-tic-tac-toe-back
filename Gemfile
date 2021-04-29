# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'bcrypt'
gem 'blueprinter'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails'
gem 'hirb'
gem 'interactor-rails'
gem 'pg', '~> 1.1'
gem 'pry-rails'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'

group :development, :test do
  gem 'awesome_print'
  gem 'factory_bot_rails'
  gem 'pry-byebug', github: 'deivid-rodriguez/pry-byebug'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
