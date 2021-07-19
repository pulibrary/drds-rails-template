# DRDS Rails Template

## Database Setup

We use Postgres and run it via Lando in development.

Lando installation: [[https://github.com/lando/lando/releases]]

Startup: `rake servers:start`

Relevant files:
 - config/application.rb
 - config/database.yml
 - .lando.yml
 - config/lando_env.rb
 - db/schema.rb
 - lib/tasks/servers.rake

## CircleCI

## RSpec

## SimpleCov (Coverage)

## Rubocop
