class Student < User
  # def self.menu
  #   puts Messages::DATA['student_dashboard']
  #   value = gets.chomp.gsub(/\D/, '').to_i
  #   case value
  #   when 1
  #     Book.all_books
  #     menu
  #   when 2
  #     Book.enrolled_books
  #     menu
  #   when 3
  #     Book.search_book
  #     menu
  #   when 4
  #     Book.enroll_book
  #   when 5
  #     Book.deposit_book
  #   when 6
  #     puts Messages::DATA['logged-out'].center(100,'-')
  #     User.new.main
  #   when 7
  #     puts Messages::DATA['exit'].center(100,'-')
  #     exit
  #   else
  #     puts "Please enter digit between 1-8".center(100,'-')
  #     menu
  #   end
  # end
end
