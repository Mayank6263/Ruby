# require_relative "loader"

class Student < User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Student'
  end

  def self.menu
    # puts "<= Logged in as Student =>".center(100,"-")
    puts Messages::DATA['student_dashboard']
    value = gets.chomp.gsub(/\D/, '').to_i
    case value
    when 1
      Book.all_books
      menu
    when 2
      Book.enrolled_books
      menu
    when 3
      # Student.student_search
      Book.search_book
      menu
    when 4
      Book.enroll_book
    when 5
      Book.deposit_book
    when 6
      puts Messages::DATA['logged-out'].center(100,'-')
      User.new.main
    when 7
      puts Messages::DATA['exit'].center(100,'-')
      exit
    else
      puts "Please enter digit between 1-8".center(100,'-')
      menu
    end
  end
end
