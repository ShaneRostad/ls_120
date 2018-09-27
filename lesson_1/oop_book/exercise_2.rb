class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  attr_accessor :name

  def better_grade_than?(other_student)
    true if grade > other_student.grade
  end

  protected

  attr_accessor :grade

end

joe = Student.new("joe", 85)

bob = Student.new("bob", 75)
puts "Well done!" if joe.better_grade_than?(bob)
