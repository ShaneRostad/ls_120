class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

hello = Hello.new
hello.hi # => "Hello"

hello.bye # => error no method

hello.greet # => wrong number of arguments error

hello.greet('Goodbye') # => "Goodbye"

hello.hi 
