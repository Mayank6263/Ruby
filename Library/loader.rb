require_relative "user"
require_relative "student"
require_relative "librarian"
require_relative "book"
require 'byebug'
require 'terminal-table'
require 'colorize'

require 'yaml'
module Messages
	DATA = YAML.load_file('messages.yml')
end