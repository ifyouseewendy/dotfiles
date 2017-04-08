begin
  require "awesome_print"
  AwesomePrint.pry!
  AwesomePrint.defaults = { :indent => -2, :limit => 50 }
rescue => _
end

def reload
  extend Rails::ConsoleMethods if require 'rails/console/app'
  reload!
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

Pry.config.theme = "railscasts"
