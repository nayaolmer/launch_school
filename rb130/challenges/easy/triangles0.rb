=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene


##PEDAC
This program will require the following workflow:
(1) Accept a triagle configuration (side 1, side 2, side 3)
(2) Check if the input is valid (all sides > 0, sum(2 sides) > 3rd side)
(3) Check if the triangle is equilateral, isosceles, or scalene

=end

class TriangleTest

  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def is_valid_triangle?
    (((side1 + side2) > side3) &&
      ((side2 + side3) > side1) &&
        ((side1 + side3) > side2) &&
          (side1 > 0 && side2 > 0 && side3 > 0))
  end

  def is_equilateral?
    side1 == side2 && side2 == side3
  end

  def is_isosceles?
    (side1 == side2 && !is_equilateral?) ||
      (side2 == side3 && !is_equilateral?) ||
        (side3 == side1 && !is_equilateral?)
  end

  def is_scalene?
    side1 != side2 && side2 != side3 && side1 != side3
  end

  def output_type
    return "Equilateral" if is_equilateral?
    return "Isosceles" if is_isosceles?
    return "Scalene" if is_scalene?
  end

  def to_s
    "This is a triangle of sides: #{side1}, #{side2}, #{side3}."
  end

  def run_test
    self.to_s
    if !is_valid_triangle?
      return "This is not a valid triangle."
    else
      triangle_type = output_type
      return "The triangle is of type #{triangle_type}"
    end
  end


end


t1 = TriangleTest.new(2, 3, 4)
puts t1.run_test