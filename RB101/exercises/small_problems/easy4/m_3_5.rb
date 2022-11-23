=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1
and some other number, and then computes the sum of those multiples.
For instance, if the supplied number is 20,
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

=end

# def multisum(user_input)
#   range_to_search = (1..user_input).to_a
#   m_3_5 = range_to_search.select {|n| n % 3 == 0 || n % 5 == 0 }
#   m_3_5.sum
# end

def multisum(user_input)
  range_to_search = (0..user_input).to_a
  m_3_5 = range_to_search.inject {|total, n| (n % 3 == 0 || n % 5 == 0 ) ? total + n : total }
  puts m_3_5
  m_3_5
end


## Examples

puts multisum(20) == 98
puts multisum(15) == 60 #(3 + 5 + 6 + 9 + 10 + 12 + 15)

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168