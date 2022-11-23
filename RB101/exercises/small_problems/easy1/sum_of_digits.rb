=begin
Write a method that takes one argument, a positive integer,
and returns the sum of its digits.
=end

def sum(int_input)
  int_input.to_s.chars.map {|n| n.to_i}.sum
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45