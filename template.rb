# frozen_string_literal: true

def add_gems
  add_gem "bundler", "2.3.18"
  add_gem "rails", "~> 6.1.3", ">= 6.1.3.2"
  add_gem "pg"
  add_gem "puma", "~> 5.0"
  add_gem "sass-rails", ">= 6"
  add_gem "webpacker", "~> 5.0"
  add_gem "turbolinks", "~> 5"
  add_gem "jbuilder", "~> 2.7"
  add_gem "bootsnap", ">= 1.4.4", require: false
  # group :development, :test do
  add_gem "bixby"
  add_gem "pry-byebug"
  add_gem "pry-rails"
  add_gem "rspec-rails", "~> 5.0.0"
  # group :development do
  add_gem "web-console", ">= 4.1.0"
  add_gem "listen", "~> 3.3"
  add_gem "rack-mini-profiler", "~> 2.0"
  add_gem "spring"
  add_gem "capistrano"
  add_gem "capistrano-passenger"
  add_gem "capistrano-rails"
  add_gem "capistrano-rails-console"
  # group :test do
  add_gem "axe-core-rspec"
  add_gem "capybara", ">= 3.26"
  add_gem "selenium-webdriver"
  add_gem "simplecov", require: false
  add_gem "webdrivers"
  # other
  add_gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
  add_gem "matrix"
  add_gem "net-imap", require: false
  add_gem "net-pop", require: false
  add_gem "net-smtp", require: false
  add_gem "strscan", "3.0.1"
end

add_gems