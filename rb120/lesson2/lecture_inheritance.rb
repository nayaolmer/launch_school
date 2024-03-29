class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end


class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    "Meow!"
  end
end

teddy = Dog.new
puts teddy.speak
puts teddy.swim

bear = Bulldog.new
puts bear.speak
puts bear.swim

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

p pete.run
# p pete.speak

p kitty.run
p kitty.speak
# p kitty.fetch

p dave.speak

p bud.run
p bud.swim