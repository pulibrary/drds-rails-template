# frozen_string_literal: true

def add_gems
  gem "bundler", "2.3.18"
  gem "rails", "~> 6.1.3", ">= 6.1.3.2"
  gem "pg"
  gem "puma", "~> 5.0"
  gem "sass-rails", ">= 6"
  gem "webpacker", "~> 5.0"
  gem "turbolinks", "~> 5"
  gem "jbuilder", "~> 2.7"
  gem "bootsnap", ">= 1.4.4", require: false
  # group :development, :test do
  gem "bixby"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 5.0.0"
  # group :development do
  gem "web-console", ">= 4.1.0"
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "capistrano"
  gem "capistrano-passenger"
  gem "capistrano-rails"
  gem "capistrano-rails-console"
  # group :test do
  gem "axe-core-rspec"
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "simplecov", require: false
  gem "webdrivers"
  # other
  gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
  gem "matrix"
  gem "net-imap", require: false
  gem "net-pop", require: false
  gem "net-smtp", require: false
  gem "strscan", "3.0.1"
end

add_gems