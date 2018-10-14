In Ruby, we are only able to inherit from a single superclass. This can at times be an issue.

Take this code for example:

```ruby

class Animal
end

class Fish < Animal
  def swim
    "Swimming"
  end
end

class Dog < Animal
  def speak
    "Woof"
  end
end

class BullDog < Dog
end

class Mastiff < Dog
end


```
In this example, both the `BullDog` and `Mastiff` classes inherit from the same `Dog` superclass, and `Dog` inherits from the `Animal` superclass. We also have the `Fish` class which inherits from the `Animal` class.

Within the `Fish` class we have a method `swim` which returns `"Swimming"`. The issue that arises is that most dogs can swim too, so we would want to add the `swim` functionality to the `Dog` class too.

To do that, we could add `swim` to the `Animal` class, although we would run into another issue because bulldog's can't swim. We want `BullDog` to inherit from `Dog`, which inherits from `Animal`, so clearly this is not going to work in our current model.

Ruby gives us a way to solve this exact problem using modules. Modules allow us to group common behaviors, and mix them into classes so we can build more DRY programs.

Here's what this would look like:


```ruby
module Swimmable
  def swim
    "Swimming"
  end
end

class Animal
end

class Fish < Animal
  include Swimmable
end

class Dog < Animal
  def speak
    "Woof"
  end
end

class BullDog < Dog
end

class Mastiff < Dog
  include Swimmable
end
```
As you can see, we have created a `Swimmable` module which contains the method `swim`, and we've mixed it in with our `Fish` and `Mastiff` classes. We do this using the keyword `include` followed by the module name.

 We have chosen to mix it in with the `Fish` class knowing that any sub-class of `Fish`, will be able to swim, whereas not all dogs can swim, so we've only included it with the `Mastiff` class.
