class Cat
  attr_reader :type
  
  def to_s
    "I am  a #{type} cat"
  end

  def initialize(type)
    @type = type
  end
end

toby = Cat.new('tabby')
p toby.to_s
