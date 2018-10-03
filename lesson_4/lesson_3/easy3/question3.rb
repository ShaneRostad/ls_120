class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end


meowth = AngryCat.new(5, 'MEOWWWWW')
kitten = AngryCat.new(3, 'KITTYYYY')
