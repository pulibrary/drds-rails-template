# DRDS Rails Template

## asdf

Most of DRDS uses asdf as a multi-language version manager.

Installation: http://asdf-vm.com/guide/getting-started.html#getting-started

This project includes a sample .tool-versions file with versions that align with
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
We use [CircleCI](https://app.circleci.com/) for continuous integration to run
linters and tests.

Relevant files:
  - .circleci/config.yml

Once the config file is added to a new project, go to the CircleCI dashboard,
find the repository, and click "Setup Project".

In the project's GitHub settings, create a branch protection rule for main and
fill in the settings used on rails_template.

## RSpec

- https://github.com/rspec/rspec-rails
- https://github.com/teamcapybara/capybara (rails adds this out of the box now)

## SimpleCov (Coverage)

## Pry / Byebug
- https://pry.github.io/
- https://github.com/deivid-rodriguez/pry-byebug#commands

## Rubocop

We install rubocop via the Samvera project [Bixby](https://github.com/samvera-labs/bixby).

Some additional rules our team uses are:
- universal double-quotes
- disable guard clauses cop
- disable postfix conditionals cop

Commit: https://github.com/pulibrary/drds-rails-template/commit/eca47cfa93f1c6565a7b72279a9fa34c7506d12b
