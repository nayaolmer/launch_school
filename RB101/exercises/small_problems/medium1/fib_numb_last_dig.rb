
def fibonacci(val)
  last2 = [1, 1]
  3.upto(val) do
    last2 = [last2[1], (last2[0] + last2[1]) % 10]
  end
  last2[1]
end

def fibonacci_last(val)

  # puts fibonacci(val).to_s[-1].to_i
  fibonacci(val).to_s[-1].to_i
end

puts fibonacci_last(15)  == 0      # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)  == 5   # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100) == 5      # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001) == 1  # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) == 3 # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) == 4 # -> 4