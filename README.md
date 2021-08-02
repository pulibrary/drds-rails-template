# DRDS Rails Template

## asdf

Most of DRDS uses asdf as a multi-language version manager.

Installation: http://asdf-vm.com/guide/getting-started.html#getting-started

This project includes a sample .tool-verions file with versions that align with
most of our existing projects.

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

We install rubocop via the Samvera project [Bixby](https://github.com/samvera-labs/bixby).

Some additional rules our team uses are:
- universal double-quotes
- disable guard clauses cop
- disable postfix conditionals cop
