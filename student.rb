require_relative 'person'
require_relative 'classroom'

# Class Student inherited from Person
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = Classroom.new(classroom)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students = self unless classroom.students.include?(self)
  end
end
