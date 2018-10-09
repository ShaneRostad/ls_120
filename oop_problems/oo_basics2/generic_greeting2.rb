class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    "Hey DOOD I'M A CAT!"
  end

  def personal_greeting
    puts "Hello, my name is #{name}!"
  end

end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
