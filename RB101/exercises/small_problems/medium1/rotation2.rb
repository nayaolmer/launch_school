

def rotate_rightmost_digits(user_input, input_split)
  arr = user_input.to_s.chars
  move = arr.delete_at(input_split * -1)
  arr << move
  output = arr.join.to_i
  puts output
  output
end



puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917