require './person'
require './capitalize_decorator'
require './trimmer_decorator'
require './classroom'
require './student'
require './book'
require './rental'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
# puts capitalized_person.correct_name
TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

class_a = Classroom.new('Class A')
class_b = Classroom.new('Class B')
felipe = Student.new(16, 'Felipe')
carlos = Student.new(15, 'Carlos')
class_a.add_student(felipe)
class_b.add_student(carlos)

# puts "Student: #{class_a.students[0].name}, Classroom: #{felipe.classroom.label}"
# puts "Student: #{class_b.students[0].name}, Classroom: #{carlos.classroom.label}"

book = Book.new('hi', 'Feli')
Rental.new('10-10-2023', book, person)

# puts "Book Title:#{rental.book.title}, Author: #{rental.book.author}, Owner: #{rental.person.name}"
