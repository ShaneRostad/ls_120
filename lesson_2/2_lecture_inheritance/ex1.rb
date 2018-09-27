class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

end

class Cat < Animal
  def speak
    'MEOWWWWWW'
  end
end


class Bulldog < Dog
  def swim
    "can't swim!"
  end
end



teddy = Bulldog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"
