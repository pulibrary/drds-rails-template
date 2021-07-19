# DRDS Rails Template

## Database Setup

We use Postgres and run it via Lando in development.

Lando installation: https://github.com/lando/lando/releases

Startup: `rake servers:start`

Relevant files:
 - config/application.rb
 - config/database.yml
 - .lando.yml
 - config/lando_env.rb
 - db/schema.rb
 - lib/tasks/servers.rake

Commit:
https://github.com/pulibrary/drds-rails-template/commit/8e96b42f274cab990c6c64bf582e4c85feededcc

## CircleCI

## RSpec

## SimpleCov (Coverage)

## Rubocop
