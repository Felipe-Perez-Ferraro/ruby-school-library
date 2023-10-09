require './person'

class Student < Person
  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\\(ツ)/¯'
  end
end
