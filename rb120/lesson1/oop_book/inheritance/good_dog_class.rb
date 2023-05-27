class Animal
  def speak
    "Hello!"
  end
  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  attr_accessor :name, :color
  def initialize(n, color)
    super(n)
    @color = color
  end

  def speak
    super + " from GoodDog class."
  end
end

class Cat < Animal
end

class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end


sparky = GoodDog.new("Sparky", "Brown")
puts sparky.speak
puts sparky.name
puts sparky.color

paws = Cat.new("Paws")
puts paws.speak

p BadDog.new(2, "bear")