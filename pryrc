# Load plugins (only those I whitelist)
# Pry.config.should_load_plugins = false
# Pry.plugins["doc"].activate!

# Launch Pry with access to the entire Rails stack.
# If you have Pry in your Gemfile, you can pass: ./script/console --irb=pry instead.
# If you don't, you can load it through the lines below :)
# rails = File.join Dir.getwd, 'config', 'environment.rb'
#
# if File.exist?(rails) && ENV['SKIP_RAILS'].nil?
#   require rails
#
#   if Rails.version[0..0] == "2"
#     require 'console_app'
#     require 'console_with_helpers'
#   elsif %w(3 4).include? Rails.version[0..0]
#     require 'rails/console/app'
#     require 'rails/console/helpers'
#   else
#     warn "[WARN] cannot load Rails console commands (Not on Rails2 or Rails3?)"
#   end
# end

begin
  require "awesome_print"
  AwesomePrint.pry!
  AwesomePrint.defaults = { :indent => -2, :limit => 50 }
rescue => e
end

# Pry.config.print = proc { |output, value| output.puts "=> #{value.ai}" }

def reload
  extend Rails::ConsoleMethods if require 'rails/console/app'
  reload!
end

# PryByebug alias
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

Pry.config.theme = "peaksea"
