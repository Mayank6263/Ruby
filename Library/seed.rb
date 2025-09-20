require_relative "loader"
require "byebug"

class Seed
  def self.load_users
    l1 = Librarian.new(name: 'john', email: 'john@yopmail.com', password: 'John@1234')
    # byebug
    unless l1.save
      puts l1.errors.join
    end
  end
end

Seed.load_users


# byebug
User.main
puts User.all
