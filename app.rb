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
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# puts capitalized_trimmed_person.correct_name

classA = Classroom.new("Class A")
classB = Classroom.new("Class B")
felipe = Student.new(16, "Felipe")
carlos = Student.new(15, "Carlos")
classA.add_student(felipe)
classB.add_student(carlos)

# puts "Student: #{classA.students[0].name}, Classroom: #{felipe.classroom.label}"
# puts "Student: #{classB.students[0].name}, Classroom: #{carlos.classroom.label}"

book = Book.new("hi", "Feli")
rental = Rental.new("10-10-2023", book, person)

# puts "Book Title:#{rental.book.title}, Author: #{rental.book.author}, Owner: #{rental.person.name}"
