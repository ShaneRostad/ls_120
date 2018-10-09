class Pet
  attr_reader :name, :type

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_accessor :name, :number_of_pets, :adopted_pets
  def initialize(name)
    @name = name
    @adopted_pets = []
    @number_of_pets = 0
  end

  def to_s
    @name
  end
end

class Shelter
  attr_accessor :pets

  def initialize
    @adoptions = Hash.new()
  end

  def adopt(owner, pet)
    if @adoptions[owner] == nil
      @adoptions[owner] = ["a #{pet.type} named #{pet.name}"]
    else
      @adoptions[owner] += ["a #{pet.type} named #{pet.name}"]
    end
    owner.number_of_pets += 1
  end

  def print_adoptions
    @adoptions.each do |adopter, pet|
        puts "#{adopter} has adopted the following pets:"
        puts pet
        puts ""
      end
  end

end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
