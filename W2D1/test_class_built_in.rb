class Car
  @@wheels = 4

  def initialize(brand, color)
    @color = color
    @brand = brand
  end

  def color=(color)
    @color = color
  end

  def change_class_var(num)
    @@wheels = num
  end

  def wheels
    @@wheels
  end

  def self.wheels
    "class method" + @@wheels.to_s
  end

  def self.change
    @@wheels = 30
  end
end

car1 = Car.new("toyota", "red")
p car1
car1.color = "blue"
p car1

p car1.wheels
# car1.change_class_var(3)
Car.change

p car1.wheels

p Car.wheels

p car1.methods
