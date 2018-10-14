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

On line 30 we instantiate a new `Person` object `bob`, and pass in the String `'Robert'`. This will result in the state of `bob` to be `@first_name = Robert, @last_name = ''`. 
