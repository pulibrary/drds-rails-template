# frozen_string_literal: true

# Modify the default Gemfile
def update_gemfile

  # Replace sqlite3 gem with pg
  gsub_file "Gemfile", 'gem "sqlite3', 'gem "pg"'
  gsub_file "Gemfile", "# Use sqlite3 as the database for Active Record", "# Use PostgreSQL as the database"

  # Update :development, :test group
  inject_into_file "Gemfile", "gem \"bixby\"\n", after: "gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]\n"
  inject_into_file "Gemfile", "gem \"pry-byebug\"\n", after: "gem \"bixby\"\n"
  inject_into_file "Gemfile", "gem \"pry-rails\"\n", after: "gem \"pry-byebug\"\n"
  inject_into_file "Gemfile", "gem \"rspec-rails\"\n", after: "gem \"pry-rails\"\n"
  gsub_file "Gemfile", "# Call 'byebug' anywhere in the code to stop execution and get a debugger console\n",''
  gsub_file "Gemfile", "gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]\n",''
  
  

  # Update :development group
  # inject_into_file 'Gemfile', '\n# Use Capistrano for deployment', after: 'group :development, :test do'
  # inject_into_file 'Gemfile', "\ngem \"capistrano\"", after: '# Use Capistrano for deployment'
  # inject_into_file 'Gemfile', '\ngem "capistrano-passenger"', after: 'gem "capistrano"'
  # inject_into_file 'Gemfile', '\ngem "capistrano-rails"', after: 'gem "capistrano-passenger"'
  # inject_into_file 'Gemfile', '\ngem "capistrano-rails-console"', after: 'gem "capistrano-rails"'

  # gem_group :test do
  #   # Automate accessibility testing
  #   gem "axe-core-rspec"
  #   # Use simplecov for coverage analysis
  #   gem "simplecov", require: false
  # end

  # # Added for Ruby 3.1 support
  # gem "matrix"
  # gem "net-imap", require: false
  # gem "net-pop", require: false
  # gem "net-smtp", require: false
  # gem "strscan", "3.0.1"
end

update_gemfile