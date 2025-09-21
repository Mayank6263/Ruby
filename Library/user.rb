require_relative "loader"
class User
  @@users = []  

  attr_accessor :name, :email, :password, :type, :errors

  def initialize(name:, email:, password:)
    @errors = []
    @name = name
    @email = email
    @password = password
    @type = self.class.to_s
  end

  def save
    if valid?
      @@users << self
      self
    else
      false
    end
  end

  def librarian?
    type == 'Librarian'
  end

  def student?
    type == 'Student'
  end

  def self.all
    @@users
  end

  private

  def valid?
    validate!
    !errors.any?
  end

  def validate!
    unless validate_email?
      set_error("Please enetr a valid email!")
    end
  end

  def set_error(val)
    errors << val
  end

  def validate_email?
    self.email =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  end

  def self.main
    # create_demo_user_data
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
      User.main
    end
  end




  def self.sign_up
    print Messages::DATA['name']
    username = gets.chomp
    print Messages::DATA['email']
    email = gets.chomp
    print Messages::DATA['password']
    password = gets.chomp
    print Messages::DATA['student_librarian_message']
    type = gets.chomp

    if type == "Student"
      Student.new(name: username, email: email, password: password).save
      Student.menu
    elsif type == "Librarian"
      Librarian.new(name: username, email: email, password: password).save
      Librarian.menu
    else
      puts Messages::DATA['student_librarian_invalid_message']
      sign_up
    end
  end

def self.sign_in
  3.times do |attempt|
    print Messages::DATA['email']
    email = gets.chomp
    print Messages::DATA['password']
    password = gets.chomp

    user = User.all.find { |u| u.email == email && u.password == password }

    if user
      puts "Login successful. Welcome, #{user.name}!"

      if user.student?
        Student.menu
      elsif user.librarian?
        Librarian.menu
      else
        puts "Unknown user type."
      end

      return # Exit after successful login
    else
      remaining_attempts = 2 - attempt
      puts "Invalid credentials. Attempts left: #{remaining_attempts}"
    end
  end

  puts "Too many failed login attempts. Exiting..."
  exit
end

  # protected
  def self.welcome
    # User Authorization
    puts Messages::DATA['welcome'].center(100, '-')
    puts Messages::DATA['main_menu']
    input = gets.chomp.gsub(/\D/, '').to_i
    input
  end

  # def create_demo_user_data
  #   Student.new('mayank','password').save
  #   Student.new('test_student','test_password').save
  #   Librarian.new('test_librarian','test_password').save
  # end

end
