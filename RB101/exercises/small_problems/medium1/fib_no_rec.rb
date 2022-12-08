
def fibonacci(val)
  counter = 2
  fibs = [1, 1]
  until counter == val
    new_fib = fibs[counter - 1] + fibs[counter - 2]
    fibs << new_fib
    counter += 1
  end
  new_fib
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501


