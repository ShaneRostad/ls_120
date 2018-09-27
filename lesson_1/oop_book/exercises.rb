module EighteenWheeler
  def can_have_eighteen_wheels?
    puts "this vehicle can have eighteen wheels - Big Boy TRUCKINNN"
  end
end

class Vehicle
  @@number_of_vehicles = 0
  attr_accessor  :color, :model
  attr_reader :year

  def initialize(year, model, color)
    @@number_of_vehicles += 1
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def self.number_of_vehicles
    puts "There are currently #{@@number_of_vehicles} vehicles"
  end

  def spray_paint(spray_color)
    self.color = spray_color
    puts "You're car is now #{color}"
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph"
  end

  def brake(number)
    @current_speed -= number
    puts "You push the break and decelerate #{number} mph"
  end

  def current_speed
    puts "you are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallen of gas"
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end

end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    puts "The #{color} #{model} car was made in #{year}"
  end

end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  include EighteenWheeler

  def to_s
    puts "The #{color} #{model} truck was made in #{year}"
  end

end


lumina = MyCar.new(1997, 'chevy lumina', 'white')
big_boy = MyTruck.new(1997, 'big boy roady toady', 'white')

puts lumina.age
