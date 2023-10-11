require './person'
require './capitalize_decorator'
require './trimmer_decorator'
require './classroom'
require './student'
require './book'
require './rental'
require './decorator'
require './teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def main
    puts 'Welcome to School Library!'
    puts
    loop do
      puts '1 - List all books.'
      puts '2 - List all people.'
      puts '3 - Create a person.'
      puts '4 - Create a book.'
      puts '5 - Create a rental.'
      puts '6 - List all rentals for a given person id.'
      puts '7 - Exit'
      choice = gets.chomp

      case choice
      when '1'
        list_books('list')
      when '2'
        list_people('list')
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        rental
      when '6'
        list_rentals
      when '7'
        quit_choose(choice)
      else
        puts 'Invalid option. Please choose a valid option.'
      end
    end
  end

  def quit_choose(choice)
    return if choice == 7

    puts 'Thank you for using this app!'
    exit
  end

  def list_books(list)
    if @books.empty?
      puts 'There is no books!'
      puts
      main
    else
      @books.map.with_index do |book, idx|
        puts "#{idx}) Title: #{book.title}, Author: #{book.author}"
      end
    end
    return unless list != 'rental'

    puts
    main
  end

  def list_people(list)
    if @people.empty?
      puts 'There is no people!'
      puts
      main
    else
      @people.map.with_index do |person, idx|
        puts "#{idx}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
    return unless list != 'rental'

    puts
    main
  end

  def create_person
    print 'Do you want to create a student (1) of a teacher (2) [Input the number]: '
    input = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    if input == 1
      create_student(name, age)
    else
      create_teacher(name, age)
    end
  end

  def create_student(name, age)
    print 'Has parent permission= [Y/N]: '
    input = gets.chomp.upcase
    permission_inpt = true
    permission_inpt = false if input == 'N'
    student = Student.new(permission_inpt, age, name)
    @people.push(student)
    puts 'Person created succesfully'
    puts
    main
  end

  def create_teacher(name, age)
    print 'Sepecialization? '
    specialization_inpt = gets.chomp.upcase
    teacher = Teacher.new(specialization_inpt, age, name)
    @people.push(teacher)
    puts 'Person created succesfully'
    puts
    main
  end

  def create_book
    print 'Title: '
    title_inpt = gets.chomp
    print 'Author: '
    author_inpt = gets.chomp
    book = Book.new(title_inpt, author_inpt)
    @books.push(book)
    puts 'Book created succesfully'
    puts
    main
  end

  def rental
    puts 'Select a book from the following list by number'
    list_books('rental')
    book_idx = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_people('rental')
    person_idx = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    create_rental(date, book_idx, person_idx)
    puts 'Rental created successfully'
    puts
    main
  end

  def create_rental(date, book_idx, person_idx)
    book = @books[book_idx]
    person = @people[person_idx]
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
    @rentals.each { |rent| puts rent.person.id }
  end

  def list_rentals
    puts 'ID of person: '
    id_inpt = gets.chomp
    puts 'Rentals: '
    person_rentals = @rentals.select { |item| item.person.id == id_inpt.to_i }
    person_rentals.map.with_index do |item, _index|
      puts "Date: #{item.date}, Book: \"#{item.book.title}\" by #{item.book.author}"
    end
    puts
    main
  end
end
