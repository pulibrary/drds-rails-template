#!/usr/bin/env ruby
# frozen_string_literal: true

require 'find'

def main
    parent_dir = File.expand_path("..", __FILE__)
    new_name = !ARGV.empty? ? ARGV[0] : File.basename(parent_dir)
    if new_name == "rails-template"
        puts "Rename parent directory, or provide target name as argument"
        exit 1
    end

    new_name_words = new_name.split /[_-]/
    new_name_cap = new_name_words.map {|word| word.capitalize}.join("")
    new_name_dash = new_name_words.join("-")
    new_name_under = new_name_words.join("_")

    puts "Finding and replacing with:"
    puts new_name_cap
    puts new_name_dash
    puts new_name_under

    # Contents of the README are relevant for template, not for the new repo:
    File.write(File.join(parent_dir, "README.md"), "\# #{new_name}\n\nTODO")

    # Walk the directory and re-write files as needed:
    Find.find(parent_dir).each do |path|
        Find.prune if File.basename(path) == ".git"
        next if File.directory? path
        next if File.basename(path) == File.basename(__FILE__)
        inplace_edit path do |line|
            line = line.gsub("DrdsRailsTemplate", new_name_cap)
            line = line.gsub("drds-rails-template", new_name_dash)
            line = line.gsub(/(drds_)?rails_template/, new_name_under)
            print line
        end
    end
end

# Based on https://stackoverflow.com/a/14249640
def inplace_edit(file, &block)
    old_stdout = $stdout
    argf = ARGF.clone

    argf.argv.replace [file]
    argf.inplace_mode = ""
    argf.each_line do |line|
        yield line
    end
    argf.close

    $stdout = old_stdout
end

main