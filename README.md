# DLS Rails Example

This project documents tooling used widely in PUL rails applications. It is
useful when setting up a new project. It is recommended to use as a reference
rather than a starting point. I.e. read through this README and other files, but
generate your own new rails app and add/configure tooling there directly.
Otherwise your new app will likely need immediate maintenance and updates.

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
https://github.com/pulibrary/rails-example/commit/8e96b42f274cab990c6c64bf582e4c85feededcc

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

Relevant files:
  - spec/spec_helper.rb

Review configuration to ensure things like example status persistence (which
powers the --only-failures flag) are turned on.

## Capistrano
We use Capistrano for deployment automation.
- https://github.com/capistrano/capistrano

Make sure your project doesn't already have a "Capfile" or "capfile" present. Then run `bundle exec cap install` to "Capify" your project.

In the auto-generated `config/deploy.rb` file, add the following line to set the default branch to main.
```
set :branch, ENV["BRANCH"] || "main"
```

Add the `write-version` task to give your project a public page at `/version.txt` with the branch name, commit SHA, and release date of the current deployment.

Some additional Capistrano-related gems our team uses:
- `capistrano-passenger`: Restarts the application automatically after deployment
  - https://github.com/capistrano/passenger
- `capistrano-rails`: Adds Rails-specific tasks for Capistrano
  - https://github.com/capistrano/rails
- `capistrano-rails-console`: Adds a remote Rails console and dbconsole
  - https://gitlab.com/ydkn/capistrano-rails-console

## SimpleCov (Coverage)
https://github.com/simplecov-ruby/simplecov

## Pry / Byebug
- https://pry.github.io/
- https://github.com/deivid-rodriguez/pry-byebug#commands

## Axe
We use Axe to automate accessibility testing.
- https://github.com/dequelabs/axe-core-gems/blob/develop/packages/axe-core-rspec

Make sure to `require "axe-rspec"` in `spec/rails_helper.rb`. 

Example accessibility spec:
- spec/features/accessibility_spec.rb

## Rubocop

We install rubocop via the Samvera project [Bixby](https://github.com/samvera-labs/bixby).

Some additional rules our team uses are:
- universal double-quotes
- disable guard clauses cop
- disable postfix conditionals cop

Commit: https://github.com/pulibrary/rails-example/commit/eca47cfa93f1c6565a7b72279a9fa34c7506d12b

## GitHub settings

Below are standard GitHub settings used by DLS applications. 

General
- The wiki can be disabled, as we do not use it for documentation
- Enable "Allow auto merge"
- Enable "Automatically delete head branches"

Branch protection rules
- The ```main``` branch should be protected by:
    - Requiring a pull request and 1 approval prior to merging branches. Stale PR approvals should be set to be dismissed when new commits are pushed. 
    - Status check passes from CircleCI for coverage_report, rubocop, and test
    - Restrict who can push to matching branches to "Organization administrators, repository administrators, and users with the Maintain role."
