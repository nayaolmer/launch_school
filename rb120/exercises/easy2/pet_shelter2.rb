
class Pet
  attr_accessor :owner, :type, :name

  def initialize(type, name)
    @type = type
    @name = name
    @owner = ''
  end
end

class Owner
  attr_accessor :pets, :name, :number_of_pets

  def initialize(name)
    @name = name
    @pets = []
    @number_of_pets = 0
  end

end

class Shelter
  attr_accessor :adoptions, :adoptable_pets

  def initialize
    @adoptions = Hash.new
    @adoptable_pets = []
  end

  def adopt(owner, pet)
    owner.pets << pet
    pet.owner = owner
    owner.number_of_pets += 1
    adoptable_pets.delete(pet)

    if !adoptions[owner]
      adoptions[owner] = [pet]
    else
      adoptions[owner] << pet
    end
  end

  def print_adoptions
    adoptions.each do |owner, pet_list|
      puts "#{owner.name} has adopted the following pets:"
      pet_list.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
      puts ""
    end
  end

  def takein_pet(pet)
    adoptable_pets << pet
  end

  def print_adoptable_pets
    puts "The Animal Shelter has the following unadopted pets:"
    adoptable_pets.each do |pet|
      puts "a #{pet.type} named #{pet.name}"
    end
    puts ""
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


asta = Pet.new('dog', 'Asta')
laddie = Pet.new('dog', 'Laddie')
fluffy = Pet.new('cat', 'Fluffy')
kat = Pet.new('cat', 'Kat')
ben = Pet.new('cat', 'Ben')
chatterbox = Pet.new('parakeet', 'Chatterbox')
bluebell = Pet.new('parakeet', 'Bluebell')

shelter.takein_pet(asta)
shelter.takein_pet(laddie)
shelter.takein_pet(fluffy)
shelter.takein_pet(kat)
shelter.takein_pet(ben)
shelter.takein_pet(chatterbox)
shelter.takein_pet(bluebell)

shelter.adopt(bholmes, bluebell)

shelter.print_adoptable_pets

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."


