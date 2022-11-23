#!/usr/bin/env ruby

require "yaml"
docker_config = YAML.load_file(".circleci/docker.yml")
rails_config = YAML.load_file("template-dir/.circleci/config.yml")

# TODO: Merge the two configurations
puts YAML.dump(docker_config)