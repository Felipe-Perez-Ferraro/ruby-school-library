class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = rand(1..100)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    puts @parent_permission || of_age?
  end

  def of_age?
    @age >= 18
  end
end
