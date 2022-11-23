=begin
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
=end

STR_TO_NUMBER = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
                  "6" => 6, "7" => 7, "8" => 8, "9" => 9}



def determine_sign(user_input)
  if user_input[0] == '-'
    -1
  else
    1
  end
end

def string_to_integer(user_input)
  sign = determine_sign(user_input)
  abs_number = user_input.delete('-').delete('+')
  numbers = abs_number.chars.map{|n| STR_TO_NUMBER[n]}
  ## Output is [1, 2, 3, 4]
  numbers.reverse!
  values = []
  numbers.each_with_index { |n, index| values << n * 10**index }
  values.sum * sign
end

puts string_to_integer('4321') == 4321
puts string_to_integer('-570') == -570
puts string_to_integer('+100') == 100

