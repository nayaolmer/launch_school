=begin
Write a method that takes one argument, 
a positive integer, and returns a list of the digits in the number.
=end

require 'pry'
def list_of_digits(digit_to_split)
  digits = digit_to_split.to_s.split('').map {|n| n.to_i}
end

binding.pry

