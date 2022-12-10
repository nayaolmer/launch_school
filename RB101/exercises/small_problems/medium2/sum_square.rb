=begin
Write a method that computes the difference between the square of the
sum of the first n positive integers and the sum of the squares of
the first n positive integers.

=end

def sum_square_difference(n)
  arr = (1..n).to_a
  a = (arr.sum) ** 2
  b = arr.map { |n| n**2 }.sum
  a - b
end












puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150