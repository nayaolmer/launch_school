
require "pry"

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

HX_TO_NUMBER = {"0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4,
                "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9,
              "A" => 10 , "B" => 11, "C" => 12, "D" => 13,
              "E" => 14, "F" => 15, "G" => 16}

def hex_to_integer(user_input)
  numbers = user_input.chars.map{|n| HX_TO_NUMBER[n.upcase]}
  ## Output is [1, 2, 3, 4]
  numbers.reverse!
  values = []
  numbers.each_with_index { |n, index| values << n * 16**index }
  values.sum
end


puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

puts hex_to_integer('4D9f') == 19871


binding.pry