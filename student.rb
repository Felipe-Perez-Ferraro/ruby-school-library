require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(_classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    puts '¯\\(ツ)/¯'
  end
end
