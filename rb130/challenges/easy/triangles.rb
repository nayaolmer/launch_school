

class Triangle

  def initialize(side1, side2, side3)
    raise ArgumentError.new("One or more sides is 0.") if side1 <=0 || side2 <=0 || side3 <=0
    raise ArgumentError.new("Invalid sides") if (side1 + side2) <= side3 || (side2 + side3) <= side1 || (side1 + side3) <= side2
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if @side1 == @side2 && @side2 == @side3
      type = 'equilateral'
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      type = 'isosceles'
    elsif @side1 != @side2 && @side2 != @side3 && @side1 != @side3
      type = 'scalene'
    end
  end

end


