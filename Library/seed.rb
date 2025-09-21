require_relative "loader"
require "byebug"
$books = []
$book_allot = []

class Seed
    def self.load_users
    users = [
      { name: 'Sawan',  email: 'sawan@librarian.com',  password: 'Sawan@123',  type: 'Librarian' },
      { name: 'Sawan', email: 'sawan@student.com', password: 'Sawan@123',  type: 'Student' },
      { name: 'Kunal',   email: 'kunal@student.com',   password: 'Kunal@123',    type: 'Student' },
      { name: 'Kunal',  email: 'kunal@librarian.com',  password: 'Kunal@123',   type: 'Librarian' }
    ]

    users.each do |user_data|
      user = case user_data[:type]
             when 'Librarian'
               Librarian.new(name: user_data[:name], email: user_data[:email], password: user_data[:password])
             when 'Student'
               Student.new(name: user_data[:name], email: user_data[:email], password: user_data[:password])
             end

      if user.save
        puts "Saved: #{user.name} (#{user.type})"
      else
        puts "Failed to save #{user.name}: #{user.errors.join(', ')}"
      end
    end
  end
end

Seed.load_users


# byebug
User.main
puts User.all
