# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

=begin PEDAC
### Problem
What we are trying to accomplish here is:
(1) Identify all the consecutive elements of the array that are at least 5 elements long
(2) identify which of these subarrays have the smallest sum
(3) Return the smallest sum OR nil if there are no consecutive elements

Assumptions
(1) We can sort the elements of the array to find consecutive numbers -- in other words,
    numbers do not have to be consecutive right off the bat
(2) Two numbers are consecutive if they are both integers and the absolute value of their difference is 1
(3) Input array will always be an array of integers


### Examples
p minimum_sum([1, 2, 3, 4]) == nil <<<< Return nil if less than 5 consecutive elements
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15 <<<< return min sum
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16  <<<< Array needs to be sorted to identify consecutive elements
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10 <<<< Array needs to be sorted, algo must accept negative numbers


### Algo
(1) define a function that takes in a single input param - an array
(2) get all the subarrays of 5 consecutive elements
(3) get the sum of all subarrays
(4) return the lowest sum

=end

### Try to figure out the tricky part

test_array = [55, 2, 6, 5, 1, 2, 9, 3, 5, 100]

def minimum_sum(some_arr)
  subarrays = []
  subarrays_sum = []
  some_arr.each_with_index do |_, idx|
    if some_arr.length - idx >= 5
      subarrays << some_arr[idx...idx+5]
      subarrays_sum << some_arr[idx...idx+5].sum
    end
  end
  subarrays_sum.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10





