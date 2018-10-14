# Example
```ruby
class Dog
  def initialize(name)
    @name = name
  end

  def say_hello
    puts "Woof! My name is #{@name}."
  end
end
# link to answer: https://launchschool.com/lessons/3315a57a/assignments/5fe1a165
```

In this program, we define a custom class `Dog`, with two methods.

First, we define `initialize`, which is the method that will be called each time we instantiate a new object of the `Dog` class. This method will initialize the instance variable `@name` to the value of the dog's name as specified by the argument.

Then, we define the instance method `say_hello`, which will print the interpolated String `"Woof! My name is #{@name}"` to the screeen, the instance variable `@name` being unique to the instance of `Dog` we call `say_hello` on. `say_hello` will return `nil`.




###----------------------------------------------------
# Example

```ruby
class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end


bob = Person.new('Robert')
rob = Person.new('Robert Smith')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
```

In this program, we define a custom class `Person`, within this class we:

First, we call the method `attr_accessor` which is built in to the Ruby  language and when called, automatically creates getter and setter methods for the instance variable specified by the symbol we pass in as an argument.

Within this code, we define a private method `parse_full_name`, which is only accessible within instance methods of the `Person` class. This method accepts one argument `full_name`.

 Within `parse_full_name` on line 46, we initialize the local variable `parts` to the value of calling `#split` on `full_name`. Then, we call `self.first_name=` which will assign the current instance's `@first_name` variable to the value of calling `parts.first`.

We repeat this on line 48 using the `self.last_name=` method, though for this we pass in a conditional `parts.size > 1` which will return `true` or `false`, and then we pass this boolean into the ternary operator to assign `@last_name` to either `parts.last` or `''` if the boolean is `true` or `false`, respectively.

In this class we also define 3 public instance methods:
* we define `initialize` which takes an argument `full_name` and passes this argument into the private method `parse_full_name`.
* we define `name=` which takes an argument `full_name`, and passes this argument into the private method `parse_full_name`.
* We define an instance method `name`, which returns the a String combining both `@first_name`, and `@last_name` separated by a space. We call `strip` on this String to remove any trailing or leading whitespace.







###----------------------------------------------------------------
#Example:

```ruby
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
```

###----------------------------------------------------------------
#Example:


# what is the result of the following code and why?
```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
p oracle.predict_the_future
```




###----------------------------------------------------------------
#Example:

```ruby
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
```




###----------------------------------------------------------------
#Example:

```ruby
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

```
###-----------------------------------------------------------------
#Example:

```ruby
class Person

  def first_name=(value)
    @first_name = value.capitalize
  end

  def last_name=(value)
    @last_name = value.capitalize
  end

  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person
```






###-----------------------------------------------------------------
#Example:

```ruby
class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(length)
    super(length, length)
  end
end


square = Square.new(5)
puts "area of square = #{square.area}"
```


###-----------------------------------------------------------------
#Example:


```ruby
class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

```




###-----------------------------------------------------------------
#Example:

```ruby
class Transform
  def initialize(data)
    @data = data
  end

  def uppercase
    @data.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
```


###-----------------------------------------------------------------
#Example:

```ruby
class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

```

###-----------------------------------------------------------------
#Example:


```ruby
class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

```


###-----------------------------------------------------------------
#Example:
```ruby
class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end
```
