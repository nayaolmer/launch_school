require "pry"

class Pet
  attr_reader :animal_type, :name

  def initialize(animal_type, name)
    @animal_type = animal_type
    @name = name
  end

end

class Owner
  attr_accessor :pet, :number_of_pets, :name

  def initialize(name)
    @name = name
    @number_of_pets = 0
    @pets = []
  end

end

class Shelter
  attr_accessor :adoptions

  def initialize
    @adoptions = Hash.new
  end

  def adopt(adopting_owner, pet)
    adopting_owner.pet << pet
    adopting_owner.number_of_pets += 1

    if !adoptions[adopting_owner]
      self.adoptions[adopting_owner] = [pet]
    else
      self.adoptions[adopting_owner] << pet
    end

  end

  def print_adoptions
    adoptions.each do |owner, pet_list|
      puts "#{owner.name} has adopted the following pets:"
      pet_list.each do |pet|
        puts "a #{pet.animal_type} named #{pet.name}"
      end
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

# p shelter.adoptions
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

