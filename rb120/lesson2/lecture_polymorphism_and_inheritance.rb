# class Animal
#   def move
#   end
# end

# class Fish < Animal
#   def move
#     puts "swim"
#   end
# end

# class Cat < Animal
#   def move
#     puts "walk"
#   end
# end

# class Sponge < Animal; end
# class Coral < Animal; end

# animals = [Fish.new, Cat.new, Sponge.new, Coral.new]
# animals.each { |animal| animal.move }


class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_wedding(self)
    end
  end
end

class Chef
  def prepare_wedding(wedding)
    prepare_food(wedding.guests)
  end
  def prepare_food(guests)
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end
  def decorate_place(flowers)
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end
  def prepare_performance(songs)
  end
end
