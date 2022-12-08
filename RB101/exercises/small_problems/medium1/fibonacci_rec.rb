=begin

fibonacci: 1, 1, 2, 3, 5, 8, 13

fibonacci(1) = 1
fibonacci(2) = 1
fibonacci(3) = 2

2 => fibonacci(1)

within the fibonacci number sequence, each fib element can be represented as the sum of the earlier elements

For example, the element 5 is the sum of 2 and 3

2 is the sum of 1 and 1

and 1 is the sum of 1 and 0

3 is the sum of 2 and 1

1 is the sum

stop at the 2nd element

return 1 if val <= 2 ### this means that if fib(1) or fib(2) is called, 1 will be returned

fib(val - 1) + fib(val - 2)
=end


def fibonacci(val)
  return 1 if val <= 2
  fibonacci(val - 1) + fibonacci(val - 2)
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765