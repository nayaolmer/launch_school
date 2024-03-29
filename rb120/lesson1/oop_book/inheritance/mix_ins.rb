module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable
end


sparky = Dog.new
nemo = Fish.new
paws = Cat.new

puts sparky.swim
puts nemo.swim
puts paws.swim
