#### Question 2
# class School
# 	attr_reader :name, :mascot

# 	def initialize(name, mascot)
# 		@name = name
# 		@mascot = mascot
# 	end

# 	def summer_break
# 		"School's out for summer!"
# 	end
# end

# stingrays = School.new("Eastern HS", "Stingray")
# pioneers = School.new("Western HS", "Pioneer")

# p stingrays.name # "Eastern HS"
# p pioneers.name # "Western HS"
# p stingrays.mascot # "Stingray"
# p pioneers.mascot # "Pioneer"
# p stingrays.summer_break # "School's out for summer!"
# p pioneers.summer_break # "School's out for summer!"

#### Question 3
# require "pry"
# module Round
#   def is_round?
#     puts "Yes, I'm round"
#   end
# end

# class Shape
#   def description
#     puts "I'm a #{self.class}"
#   end

#   def next_ancestor
#     puts self.class.ancestors[1]
#   end
# end

# class Rectangle < Shape; end
# class Square < Rectangle; end
# class Circle < Shape
#   include Round
# end

# rectangle = Rectangle.new
# square = Square.new
# circle = Circle.new

# rectangle.description # I'm a Rectangle
# square.description # I'm a Square
# circle.description # I'm a Circle

# rectangle.next_ancestor # Shape
# square.next_ancestor # Rectangle
# circle.next_ancestor # Round

# rectangle.is_round? # NoMethodError
# square.is_round? # NoMethodError
# circle.is_round? # Yes I'm round

#### Question 4
# class BankAccount

#   attr_reader :user_name, :id, :saving
#   attr_writer :user_name, :checking, :saving

#   def initialize(user_name, id, checking)
#     @user_name = user_name
#     @id = id
#     @checking = checking
#   end


# end

# bank_account = BankAccount.new('Prince', 543212345, 10000)

# p bank_account.user_name # 'Prince'
# bank_account.user_name = "The artist formerly known as #{bank_account.user_name}"
# p bank_account.id # 543212345
# bank_account.id = 222222222 # NoMethodError
# p bank_account.checking # NoMethodError
# bank_account.checking = 20000
# p bank_account.saving # nil
# bank_account.saving = 1000000000
# p bank_account #<BankAccount:0x00007f1e26da8b58 @user_name="The artist formerly known as Prince", @id=543212345, @checking=20000, @saving=1000000000>

#### Question 5


# class Movie
#   attr_accessor :title, :tagline

#   def initialize(title, tagline)
#     @title = title
#     @tagline = tagline
#   end

#   def format_movie_info
#     @title = title.capitalize
#     @tagline = tagline.capitalize
#     "#{title}: #{tagline}"
#   end
# end

# ghostbusters = Movie.new('ghostbusters', 'who you gonna call?')

# p ghostbusters.format_movie_info # Ghostbusters: Who you gonna call?
# p ghostbusters.title # Ghostbusters
# p ghostbusters.tagline # Who you gonna call?

#### Question 6

# class Book
#   attr_reader :title, :author

#   def initialize(title, author)
#     @title = title
#     @author = author
#   end

#   def ==(other)
#     author == other.author
#   end

# end

# kindred = Book.new('Kindred', 'Octavia E. Butler')
# fledgling = Book.new('Fledgling', 'Octavia E. Butler')
# imposter = Book.new('Imposter', 'Philip K. Dick')
# minority_report = Book.new('Minority Report', "Philip K. Dick")

# p kindred == fledgling        # should output true
# p fledgling == imposter       # should output false
# p imposter == minority_report # should output true

#### Question 7


class Spaceship

  def initialize(craft_name, captain, speed)
    @craft_name = craft_name
    @captain = captain
    @speed= speed
  end

end

class Spaceship
  attr_writer :craft_name, :captain, :speed

  def initialize(craft_name, captain, speed)
    self.craft_name = craft_name
    self.captain = captain
    self.speed= speed
  end
end

uss_enterprise = Spaceship.new('USS Enterprise', 'Jean-Luc Picard', 'Warp 9.6')

uss_enterprise = Spaceship.new('USS Enterprise', 'Jean-Luc Picard', 'Warp 9.6')
p uss_enterprise

class Car

  @@total_starts = 0

  def start
    puts "Vroom"
    @@total_starts += 1
  end

  def self.total_starts
    @@total_starts
  end

end

car = Car.new

car.start
p Car.total_starts # 1
car.start
p Car.total_starts # 2
car.start
p Car.total_starts # 3


Question 9

class Magician

  attr_reader :stage_name, :signature_trick

  def initialize(stage_name, real_name, age, signature_trick)
    @stage_name = stage_name
    @real_name = real_name
    @age = age
    @signature_trick = signature_trick
  end

  def older?(other_magician)
    age > other_magician.age
  end

  def reveal_name
    "My real name is #{real_name}"
  end

  private
  attr_reader :real_name

  protected
  attr_reader :age
end

criss_angel = Magician.new('Criss Angel', 'Christopher Sarantakos', 54, 'walk on water')
the_amazing_johnathan = Magician.new('The Amazing Johnathan', 'Johnathan Szeles', 63, 'the white rabbit')

p criss_angel.stage_name # Criss Angel
p criss_angel.real_name # NoMethodError
p criss_angel.reveal_name # My real name is Christopher Sarantakos
p criss_angel.age # NoMethodError
p criss_angel.signature_trick # walk on water
p criss_angel.older?(the_amazing_johnathan) # false





module Speakable
  def i_can_speak
    puts "I'm a #{self.class}. I can speak! Wahoo."
  end
end

class Human
  include Speakable
end

class Bird
end

class Sparrow < Bird
end

class Hawk < Bird
end

class TalkingParrot < Bird
  include Speakable
end

bob = Human.new
my_parrot = TalkingParrot.new

bob.i_can_speak #> I'm a Human. I can speak! Wahoo.
my_parrot.i_can_speak #> I'm a TalkingParrot. I can speak! Wahoo.
Hawk.i_can_speak #> NoMethodError




module MyOutOfPlaceMethods

  def self.how_do_you_measure_a_year(preferred_type)
    if preferred_type == 'in_minutes'
      525600
    elsif preferred_type == 'in_moments'
      "How many moments?"
    else
      "Rent is a great musical"
    end
  end

  def self.where_does_puff_live?
    "By the sea"
  end

end

p MyOutOfPlaceMethods.how_do_you_measure_a_year('in_minutes') #> 525600
p MyOutOfPlaceMethods.where_does_puff_live? #> "By the sea"



class IceCreamScoop
  @@total_scoops = 0

  def initialize(flavor, double=false)
    @flavor = flavor
    @double = double
    @@total_scoops += 1
    update_total_scoops
  end

  def make_it_a_double_scoop
    @double = true ### Updated this from double = true to @double = true
    update_total_scoops
  end

  def total_scoops ### Updated this from total_scoops to self.total_scoops
    @@total_scoops
  end

  private

  attr_accessor :double

  def update_total_scoops
    @@total_scoops += 1 if double == true
  end
end

my_scoops = IceCreamScoop.new('strawberry')
p IceCreamScoop.total_scoops
my_scoops.make_it_a_double_scoop
p IceCreamScoop.total_scoops # 2