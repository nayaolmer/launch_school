=begin
Write a method that takes one integer argument, 
which may be positive, negative, or zero. 
This method returns true if the number's absolute value is odd. 
You may assume that the argument is a valid integer value.
=end

require 'pry'

def check_if_odd(number_to_check)
  number_to_check.abs % 2 == 0? false : true
end

binding.pry
