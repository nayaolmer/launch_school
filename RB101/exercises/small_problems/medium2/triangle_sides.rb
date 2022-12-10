=begin ## Rules of Triangles
Triangle Type:
sides = [side1, side2, side3]
sides.uniq == 1 << equalateral
sides.uniq == 2 << isosceles
sides.uniq == 3 << scalene

Triangle
Isosceles -- two of the sides are the same
>> side1 == side 2 && side1 != side 3)




=end

require "pry"

def valid_triangle?(side1, side2, side3)
  sides = [side1, side2, side3].sort
  shortest = sides.min
  longest = sides.pop
  result = sides.sum > longest && shortest > 0
end

def triangle_type(side1, side2, side3)
  sides = [side1, side2, side3]
  triangle_type = ''
  if sides.uniq.length == 1
    triangle_type = :equilateral
  elsif sides.uniq.length == 2
    triangle_type = :isosceles
  elsif sides.uniq.length == 3
    triangle_type = :scalene
  end
  triangle_type
end

def triangle(side1, side2, side3)
  if valid_triangle?(side1, side2, side3)
    triangle_type(side1, side2, side3)
  else
    :invalid
  end
end


# binding.pry





puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid