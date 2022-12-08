
def rotate_rightmost_digits_str(user_input_str, input_split)
  arr = user_input_str.chars
  move = arr.delete_at(input_split)
  arr << move
  output = arr.join
  # puts output
  output
end


def max_rotation(some_number)
  some_num_str = some_number.to_s
  length = some_num_str.length

  count = 0

  while count < length
    # puts count
    some_num_str = rotate_rightmost_digits_str(some_num_str, count)
    # puts some_num_str
    count += 1
  end

  output = some_num_str.to_i
  output
end


puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
puts max_rotation(300000004)



