# frozen_string_literal: true

# Modify the default Gemfile
def update_gemfile
  # Replace sqlite3 gem with pg
  gsub_file "Gemfile", "gem 'sqlite3', \'~> 1.4\'", "gem 'pg'"
  gsub_file "Gemfile", "# Use sqlite3 as the database for Active Record", "# Use PostgreSQL as the database"

  # Update :development, :test group
  inject_into_file "Gemfile", "  gem 'bixby'\n", after: "gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]\n"
  inject_into_file "Gemfile", "  gem 'pry-byebug'\n", after: "gem 'bixby'\n"
  inject_into_file "Gemfile", "  gem 'pry-rails'\n", after: "gem 'pry-byebug'\n"
  inject_into_file "Gemfile", "  gem 'rspec-rails', '~> 5.0'\n", after: "gem 'pry-rails'\n"
  gsub_file "Gemfile", "  # Call 'byebug' anywhere in the code to stop execution and get a debugger console\n",''
  gsub_file "Gemfile", "  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]\n",''
  
  # Update :development group
  inject_into_file "Gemfile", "  # Use Capistrano for deployment\n", after: "gem 'spring'\n"
  inject_into_file "Gemfile", "  gem 'capistrano'\n", after: "# Use Capistrano for deployment\n"
  inject_into_file "Gemfile", "  gem 'capistrano-passenger'\n", after: "gem 'capistrano'\n"
  inject_into_file "Gemfile", "  gem 'capistrano-rails'\n", after: "gem 'capistrano-passenger'\n"
  inject_into_file "Gemfile", "  gem 'capistrano-rails-console'\n", after: "gem 'capistrano-rails'\n"

  # Update :test group
  inject_into_file "Gemfile", "  # Automate accessibility testing\n", after: "group :test do\n"
  inject_into_file "Gemfile", "  gem 'axe-core-rspec'\n", after: "# Automate accessibility testing\n"
  inject_into_file "Gemfile", "  # Use simplecov for coverage analysis\n", after: "gem 'selenium-webdriver', '>= 4.0.0.rc1'\n"
  inject_into_file "Gemfile", "  gem 'simplecov', require: false\n", after: "# Use simplecov for coverage analysis\n"

  # Other gems
  inject_into_file "Gemfile", "\n# Added for Ruby 3.1 support\n", after: "gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]\n"
  inject_into_file "Gemfile", "gem 'matrix'\n", after: "# Added for Ruby 3.1 support\n"
  inject_into_file "Gemfile", "gem 'net-imap', require: false\n", after: "gem 'matrix'\n"
  inject_into_file "Gemfile", "gem 'net-pop', require: false\n", after: "gem 'net-imap', require: false\n"
  inject_into_file "Gemfile", "gem 'net-smtp', require: false\n", after: "gem 'net-pop', require: false\n"
  inject_into_file "Gemfile", "gem 'strscan', '3.0.1'\n", after: "gem 'net-smtp', require: false\n"
end

update_gemfile