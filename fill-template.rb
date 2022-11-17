#!/usr/bin/env ruby
# frozen_string_literal: true

def main
    parent_dir = File.expand_path("..", __FILE__)
    Dir.chdir(parent_dir)
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

    Dir.glob("**/*").each do |file|
        next if File.directory? file
        next if File.basename(file) == __FILE__
        next if file.match /\.git\//
        inplace_edit file do |line|
            line = line.gsub("FooBar", new_name_cap)
            line = line.gsub("foo-bar", new_name_dash)
            line = line.gsub(/(drds_)?foo_bar/, new_name_under)
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