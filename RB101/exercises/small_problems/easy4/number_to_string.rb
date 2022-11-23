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

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

# binding.pry