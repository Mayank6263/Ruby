require_relative 'user'

class Librarian < User
  # def initialize(email, password)
  #   @email = email
  #   @password = password
  #   @type = 'Librarian'
  # end

  # def self.menu
  #   puts Messages::DATA['librarian_dashboard']

  #   task = gets.chomp.gsub(/\D/, '').to_i
  #   case task
  #   when 1
  #     puts Messages::DATA['create_book'].center(100,'-')
  #     print Messages::DATA['book_title']
  #     title = gets.chomp
  #     print Messages::DATA['book_author']
  #     author = gets.chomp
  #     Book.create_book(title,author)
  #   when 2
  #     Book.search_book
  #     Librarian.menu
  #   when 3
  #     Book.all_books
  #     Librarian.menu
  #   when 4
  #     Book.update_book
  #     Librarian.menu
  #   when 5
  #     puts Messages::DATA['delete_book'].center(100,'-')
  #     Book.deletebook
  #     Librarian.menu
  #   when 6
  #     puts Messages::DATA['logged_out']
  #     User.new.main
  #   when 7
  #     return Messages::DATA['exit']
  #     exit
  #   else
  #     puts "Please enter digit between 1-7"
  #     Librarian.menu
  #   end
  # end
end
