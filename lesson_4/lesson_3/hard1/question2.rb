class Vehicle

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle < Vehicle
  attr_accessor :speed, :heading, :km_traveled_per_liter, :liters_of_fuel_capacity

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  attr_accessor :fuel_capacity, :fuel_efficiency
  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    # 2 tires are various tire pressures
    super(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    #super([20,20], 80, 8.0)
  end
end

class Catamaran < Vehicle
  attr_accessor :propeller_count, :hull_count, :speed, :heading, :fuel_capacity, :fuel_efficiency

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    super(km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

johny = Catamaran.new(3, 3, 50, 25)
p johny

new_bike = Motorcycle.new([20, 20], 80, 8.0)
p new_bike
