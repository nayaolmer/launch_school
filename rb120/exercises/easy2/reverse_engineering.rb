
require "pry"

class Transform
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def uppercase
    self.value.upcase
  end

  def self.lowercase(some_string)
    some_string.downcase
  end

end


# binding.pry

my_data = Transform.new('abc')

# binding.pry
puts my_data.uppercase
puts Transform.lowercase('XYZ')

# binding.pry