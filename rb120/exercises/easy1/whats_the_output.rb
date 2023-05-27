require "pry"
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s ### The .to_s function here is "to string", not the method defined below. But why?
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts "fluffy.name:"
puts fluffy.name      ## "42"
puts "fluffy:"
puts fluffy           ## My name is 42.
puts "fluffy.name:"
puts fluffy.name      ## "42"
puts "name:"          ## 43
puts name


binding.pry