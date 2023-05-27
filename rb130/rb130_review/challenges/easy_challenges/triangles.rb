
require "pry"

puts $LOADED_FEATURES.grep(/pry\.rb/)

class Triangle

  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    if side1 <= 0 || side2 <= 0 || side3 <=0
      raise ArgumentError
    elsif (side1 + side2 <= side3) ||
          (side1 + side3 <= side2) ||
          (side2 + side3 <= side1)
      raise ArgumentError
    else
      @side1 = side1
      @side2 = side2
      @side3 = side3
    end
  end

  def kind
    if side1 == side2 && side2 == side3
      return 'equilateral'
    elsif (side1 == side2 && side1 != side3) ||
        (side2 == side3 && side2 != side1) ||
        (side1 == side3 && side3 != side2)
        return ('isosceles')
    elsif side1 != side2 && side2 != side3
      return('scalene')
    end
  end
end



# binding.pry