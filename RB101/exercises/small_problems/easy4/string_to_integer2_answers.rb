

STR_TO_NUMBER = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
                  "6" => 6, "7" => 7, "8" => 8, "9" => 9}

def string_to_integer(user_input)
  numbers = user_input.chars.map{|n| STR_TO_NUMBER[n]}
  ## Output is [1, 2, 3, 4]
  numbers.reverse!
  values = []
  numbers.each_with_index { |n, index| values << n * 10**index }
  values.sum
end

def string_to_signed_int(user_input)
  case user_input[0]
  when '-' then string_to_integer(user_input[1..-1]) * -1
  when '+' then string_to_integer(user_input[1..-1])
  else string_to_integer(user_input)
  end
end



puts string_to_signed_int('4321') == 4321
puts string_to_signed_int('-570') == -570
puts string_to_signed_int('+100') == 100