require "pry"

NUM_TO_STR = {0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5",
6 => "6", 7 => "7", 8 => "8", 9 => "9"}



def integer_to_string(user_input)
  digits = []
  power = 1
  round = nil

  while round != user_input
    round = user_input % 10**power
    digit = (user_input % 10**power)/(10**(power - 1))
    digits << digit
    power += 1
  end

  digits.reverse.map { |n| NUM_TO_STR[n]}.join

end


# def signed_integer_to_string(user_input)
#   if user_input < 0
#     "-#{integer_to_string(user_input.abs)}"
#   elsif user_input > 0
#     "+#{integer_to_string(user_input)}"
#   else
#     "0"
#   end
# end

def signed_integer_to_string(user_input)
  base_number = integer_to_string(user_input.abs)
  if user_input < 0
    "-#{base_number}"
  elsif user_input > 0
    "+#{base_number}"
  else
    "0"
  end
end



puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

# binding.pry