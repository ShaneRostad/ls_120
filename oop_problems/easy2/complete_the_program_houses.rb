class House
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def greater_price_than?(other_home)
    @price > other_home.price
  end

end

home1 = House.new(100_000)
home2 = House.new(150_000)
p home1.greater_price_than?(home2) ? "Home 1 is cheaper" : "Home 2 is more expensive"
