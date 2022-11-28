







def center_of(some_string)
  length = some_string.length
  if length.even?
    some_string[length / 2 - 1..length / 2]
  else
    some_string[length / 2]
  end
end





puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'