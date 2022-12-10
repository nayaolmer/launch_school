

def triangle(a, b, c)
  if (a + b + c != 180) || ([a, b, c].include? 0)
    :invalid
  elsif [a, b, c].all? { |n| n < 90 }
    :acute
  elsif [a, b, c].max > 90
    :obtuse
  elsif [a, b, c].include? 90
    :right
  end
end














puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid