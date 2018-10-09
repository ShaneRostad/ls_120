module Walk
  def walk
    puts "#{name} #{self.gait} forward"
  end
end

class Person
  include Walk
  attr_reader :name

  def initialize(name)
    @name = name
  end

  protected

  def gait
    "strolls"
  end
end

class Cat
  include Walk

  attr_reader :name

  def initialize(name)
    @name = name
  end

  protected

  def gait
    "saunters"
  end
end

class Cheetah
  include Walk
  attr_reader :name

  def initialize(name)
    @name = name
  end

  protected

  def gait
    "runs"
  end
end



mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"
