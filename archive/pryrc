# frozen_string_literal: true
# Refer to: https://gist.github.com/justin808/1fe1dfbecc00a18e7f2a#file-pryrc-L1

begin
  require "awesome_print"
  AwesomePrint.pry!
  AwesomePrint.defaults = { indent: -2, limit: 50 }
rescue LoadError => _
  puts "no awesome_print :("
end

def reload
  extend Rails::ConsoleMethods if require "rails/console/app"
  reload!
end

if defined?(PryByebug)
  Pry.commands.alias_command "c", "continue"
  Pry.commands.alias_command "s", "step"
  Pry.commands.alias_command "n", "next"
  Pry.commands.alias_command "f", "finish"
end

Pry.config.theme = "railscasts"

## Useful Collections

def a_array
  (1..6).to_a
end

def a_hash
  { hello: "world", free: "of charge" }
end
