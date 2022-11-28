=begin ### Prompt
Write a method that calculates and returns the index of the first Fibonacci number
that has the number of digits specified as an argument.
(The first Fibonacci number has index 1.)
=end

=begin ### Notes

# Problem
input = integer specifying the number of digits in the number to look for
output = the index of the smallest number whose length = input. Index starts at 1, not 0

## Test cases (see below)
## Algorithm
We will need a method that can
(1) generate fibonacci numbers
(2) Stop generating fibonacci numbers once the requirements are met
(3) Returns the index of the fibonacci number that satisfies the requirement
(4) adds 1 to the index so that it meets the indexing requirements


fibonacci sequence = [1, 1, 2, 3, 5, 8, 13, ]




=end

require "pry"

def find_fibonacci_index_by_length(num_of_digits)
  fibs = [0, 1]
  new_fib = 1
  idx = 1
  until new_fib.to_s.length == num_of_digits
    idx += 1
    new_fib = fibs[-2] + fibs[-1]
    fibs << new_fib
  end
  return idx
end



### Test Cases
puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847


