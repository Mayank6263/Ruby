require_relative "user"
require_relative "student"
require_relative "librarian"
require_relative "book"
require 'byebug'

require 'yaml'
module Messages
	DATA = YAML.load_file('messages.yml')
end