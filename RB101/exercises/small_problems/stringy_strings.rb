=begin
Write a method that takes one argument, a positive integer,
and returns a string of alternating 1s and 0s, always starting with 1.
The length of the string should match the given integer.
=end

require 'pry'

def stringy(int_input = 1)
  return_str = ''
  (1..int_input).each do |n|
    if n.odd?
      return_str << int_input
    else
      return_str << (int_input - 1).abs
    end
  end
  return_str
end

binding.pry

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


