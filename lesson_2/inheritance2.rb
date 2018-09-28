class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end

end

class Cat < Pet
  def speak
    'Meow!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end

  def swim
    "swimming!"
  end
end

class BullDog < Dog
  def swim
    "can't swim!"
  end
end

teddy = BullDog.new
kitty = Cat.new
puts kitty.speak
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"
p BullDog.ancestors
