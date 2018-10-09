class Cat
  attr_reader :name

  def to_s
    "I'm #{@name}"
  end

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')
puts kitty
