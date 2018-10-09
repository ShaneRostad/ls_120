module Walk
  def walk
    puts "#{name} #{self.gait} forward"
  end
end

class Noble
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{title} #{name} #{gait} forward"
  end

  protected

  def gait
    "struts"
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


byron = Noble.new("Byron", "Lord")
p byron.walk
