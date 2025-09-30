class Book
  def self.create_book(title,author)
    @title = title
    @author = author
    $books << {title: @title, author: @author}
    puts Messages::DATA['enter']
    b  = gets.chomp
    Librarian.menu if (b)
  end

  def self.all_books
  puts ""
  puts " Available Books = #{$books.count} ".center(100, "=").colorize(:cyan)
  puts "".center(100, '-')

  rows = $books.each_with_index.map do |book, index|
    [index + 1, book[:title], book[:author].to_s.colorize(:green)]
  end

  table = Terminal::Table.new(
    title: "Books in Library",
    headings: ['#', 'Title', 'Author'],
    rows: rows
  )

  puts table
end


  def self.update_book
     puts Messages::DATA['search']
    way = gets.chomp.to_i
    case way
    when 1
      puts Messages::DATA['title'].center(100,'-')
      puts Messages::DATA['old_title']
      inp = gets.chomp
      exist_title = $books.find{|x| x[:title] == inp}
      if exist_title
        puts "<= Update Title=>".center(100,'-')
        print "New Title :- "
        title = gets.chomp
        exist_title[:title] = title
      elsif
        puts Messages::DATA['no_book']
      end
    when 2
      puts Messages::DATA['author'].center(100,'-')
      print Messages::DATA['old_author']
      inp = gets.chomp
      exist_author = $books.find{|x| x[:author] == inp}
      if exist_author
        puts "<= Update Author=>".center(100,'-')
        print "New Author :- "
        author = gets.chomp
        exist_author[:author] = author
      else
        puts Messages::DATA['no_book']
      end
    when 3
      puts "Search By any of them"
      puts "Old title and Author :- "
      inp = gets.chomp
      exist_book = $books.find{|x| x[:title] == inp || x[:author] == inp}

      if exist_book
        puts "<= Update Title & Author =>".center(100,'-')
        print "New title :- "
        title = gets.chomp
        exist_book[:title] = title
        print "New Author :- "
        author = gets.chomp
        exist_book[:author] = author
      else
        puts Messages::DATA['no_book']
      end
    when 4
      Librarian.menu
    else 
      puts "Invalid Digits:- Enter digits between 1-4"
    end
  end

  def self.enrolled_books
    puts ""
    puts "#{$book_allot.count} Enrolled Books".center(100,"=")
    puts "".center(100,'-')
    puts "Sn." + "Title".center(30) + "Author\n"
    puts "".center(100,'_')
    $book_allot.each_with_index { |book, index| puts "#{index+1}- #{book[:title].center(30)} #{book[:author]}" }
    puts ""
  end
  
  def self.search_book
    puts "<= Searching =>".center(100,'-')
    puts Messages::DATA['search']
    way = gets.chomp.gsub(/\D/, '').to_i
    case way 
    when 1
      puts Messages::DATA['title'].center(100,'-')
      self.search_by_title
      puts Messages::DATA['enter']
      b = gets.chomp
    when 2
      puts Messages::DATA['author'].center(100,'-')
      self.search_by_author
      puts Messages::DATA['enter']
      b = gets.chomp
    when 3
      puts .center(100,'-')
      self.search_by_both
      puts Messages::DATA['enter'] 
      b = gets.chomp
    when 4
      puts "back"
    end
  end

  def self.search_by_both
    3.times do
      print Messages::DATA['input_both']
      search = gets.chomp.strip
      book = $books.find {|x| x[:title] == search || x[:author] == search}
      if book.nil?
        puts Messages::DATA['no_book']
      else
        puts Messages::DATA['book_looking']

        book.each {|k,v| puts "#{k}  => #{v}"}
        break
      end
    end
  end

  def self.search_by_title
    3.times do |x|
      print Messages::DATA['ttl']
      search = gets.chomp.strip
      book = $books.find {|x| x[:title] == search}
      if book.nil?
        puts Messages::DATA['no_book']
      else
        puts Messages::DATA['book_looking']

        book.each {|k,v| puts "#{k}  => #{v}"}
        break
      end
    end
  end

  def self.search_by_title_author
    3.times do |x|
      print "Title :- "
      search = gets.chomp.strip
      book = $books.find {|x| x[:title] == search}
      if book.nil?
        puts Messages::DATA['no_book']
      else
        puts Messages::DATA['book_looking']

        book.each {|k,v| puts "#{k}  => #{v}"}
        break
      end
    end
  end

  def self.search_by_author
    3.times do |x|
      print Messages::DATA['authr']
      search = gets.chomp.strip
      book = $books.find {|x| x[:author] == search}
      if book.nil?
        puts Messages::DATA['no_book']
      else
        puts Messages::DATA['book_looking']
        book.each {|k,v| puts "#{k}  => #{v}"}
        break
      end
    end
  end

  def self.enroll_book
    3.times do |x|
      print "Enter book title to enroll :- "
      title = gets.chomp
      book = $books.find {|x| x[:title]== title}
       
      if book.nil?
        puts Messages::DATA['no_book']
      else
        $book_allot << book
        $books.delete(book)
        enrolled_books
        break        
      end
    end
    puts Messages::DATA['enter'].center(100,'-')
    b = gets.chomp
    Student.menu if b
 end

  def self.deposit_book
    3.times do |x|
      print "Enter book title to deposit :- "
      title = gets.chomp
      book = $book_allot.find {|x| x[:title]== title}

      if book.nil?
        puts Messages::DATA['no_book']
      else
        $books << book
        $book_allot.delete(book)
        all_books
        break
      end
    end 
      puts Messages::DATA['enter'].center(100,'-')
      b = gets.chomp
      Student.menu if b
  end

  def self.deletebook
    puts Messages::DATA['search']
    way = gets.chomp.gsub(/\D/,"").to_i
    if way == 1
      puts Messages::DATA['title'].center(100,'-')
      print Messages::DATA['ttl']
      inp = gets.chomp
      exist_title = $books.find{|x| x[:title] == inp}
      puts exist_title
      if exist_title
        $books.delete(exist_title)
        puts Messages::DATA['enter']
      else
        puts Messages::DATA['no_book']
      end
    elsif way == 2
      puts Messages::DATA['author'].center(100,'-')
      print Messages::DATA['old_author']
      inp = gets.chomp
      exist_author = $books.find{|x| x[:author] == inp}
      puts exist_author
      if exist_author
        $books.delete(exist_author)
        puts Messages::DATA['enter']
      else
        puts Messages::DATA['no_book']
        Librarian.menu
      end
    elsif way == 3
      3.times do |x|
        # puts "You have #{3-x}, You are on #{x+1} attempt"
        print Messages::DATA["total_attempt"]
        print "#{ 3-x } attempts. "
        # puts Messages::DATA['attempt_num'] + x+1 + " attempts. "
        puts Messages::DATA['both'].center(100,'-')
        print Messages::DATA['input_both']
        inp = gets.chomp
        exist_author = $books.find{|x| x[:author] == inp}
        puts exist_author
        if exist_author
          $books.delete(exist_author)
          puts Messages::DATA['enter']
        else
          puts Messages::DATA['no_book']
        end
      end
    end
  end
end
