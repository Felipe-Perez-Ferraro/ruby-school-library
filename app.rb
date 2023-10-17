require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'validate_input'

# Class containing script for user interface
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run(option)
    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rental
    else
      puts 'Invalid option'
    end
  end

  def list_all_books
    puts 'Library is empty' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index + 1} | Book: #{book.title} | Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'No person is registered' if @people.empty?
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index + 1} [Student] ID: #{person.id} | Name: #{person.name} | Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index + 1} [Teacher] ID: #{person.id} | Name: #{person.name} | Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Please select an option'
    puts '1 - Create a student'
    puts '2 - Create a Teacher'
    print 'Enter your option: '
    person_option = gets.chomp.to_i
    case person_option
    when 1
      @people << create_student
      puts 'Student data submitted successfully'
    when 2
      @people << create_teacher
      puts 'Teacher data added successfully'
    else
      puts 'Invalid option'
    end
  end

  def create_student
    print 'Enter student name: '
    name = gets.chomp
    print 'Enter student age: '
    age = gets.chomp.to_i
    print "Enter student's classroom: "
    classroom = gets.chomp
    print "Enter student's parent permission[Y/N]: "
    parent_permission = gets.chomp
    Student.new(classroom, age, name, parent_permission: parent_permission)
  end

  def create_teacher
    print 'Enter teacher name: '
    name = gets.chomp
    print 'Enter teacher age: '
    age = gets.chomp.to_i
    print "Enter teacher's specialization: "
    specialization = gets.chomp
    Teacher.new(specialization, age, name)
  end

  def create_book
    print "Enter book's title: "
    title = gets.chomp
    print "Enter book's author: "
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book data added successfully'
  end

  def create_rental
    if @books.empty?
      puts 'Please create a book first.'
    elsif @people.empty?
      puts 'Please create a person first.'
    else
      list_all_books
      print "Enter book's index: "
      book = gets.chomp.to_i
      book = @books[book - 1]
      list_all_people
      print "Enter person's index: "
      person = gets.chomp.to_i
      person = @people[person - 1]
      print 'Enter date: '
      date = gets.chomp
      @rentals << Rental.new(date, person, book)
      puts 'Rental data added successfully'
    end
  end

  def list_rental
    if @rentals.empty?
      puts 'No rentals registered'
    else
      list_all_people
      print "Enter person's ID: "
      id = gets.chomp.to_i
      rents = @rentals.select { |rental| rental.person.id.eql?(id) }
      rents.each do |rent|
        puts "Date: #{rent.date} | Person: #{rent.person.name} | Book: #{rent.book.title} by #{rent.book.author}"
      end
    end
  end
end
