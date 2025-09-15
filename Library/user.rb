# require_relative 'loader'


class User
  def main
    create_demo_user_data
    value = welcome

    case value
    when 1
      sign_up
    when 2
      sign_in
    when 3
      puts Messages::DATA['exit']
      exit
    else
      puts Messages::DATA['invalid']
      User.new.main
    end
  end

  def save
    $users << {email: @email, password: @password, type: @type}
  end

  def sign_in
    print Messages::DATA['email']
    email = gets.chomp
    print Messages::DATA['password']
    password = gets.chomp
    user = $users.find {|x| x[:email] == email && x[:password] == password}
      
    3.times do |x|
      puts "inside times #{x}"
      print Messages::DATA['total_attempt']
      puts "#{3-x} attempts left"
      if user.nil?
        puts Messages::DATA['invalid_credential']
        sign_in
      else
        Student.menu
      end
    end
  end

  def sign_up
    print Messages::DATA['email']
    email = gets.chomp
    print Messages::DATA['password']
    password = gets.chomp
    print Messages::DATA['student_librarian_message']
    type = gets.chomp

    if type == "Student"
      Student.new(email,password).save
      Student.menu
    elsif type == "Librarian"
      Librarian.new(email,password).save
      Librarian.menu
    else
      puts Messages::DATA['student_librarian_invalid_message']
      sign_up
    end
  end

  protected
  def welcome
    # User Authorization
    puts Messages::DATA['welcome'].center(100, '-')
    puts Messages::DATA['main_menu']
    input = gets.chomp.gsub(/\D/, '').to_i
    input
  end

  def create_demo_user_data
    Student.new('mayank','password').save
    Student.new('test_student','test_password').save
    Librarian.new('test_librarian','test_password').save
  end

end
