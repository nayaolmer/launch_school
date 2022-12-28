# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
#                             == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".


=begin PEDAC
### Problem
Input: An array of numbers, can be non-unique
Output: an array where every element is the count of unique numbers smaller than the element in the input array at the same index

Requirements/assumptions:
(1) if no numbers are smaller than the element, return 0
(2) assume input parameter will always be an array of integers

### Examples
(see above)

## Algo
(1) Def method, input parameter is array of numbers
(2) iterate over every element in the array
>> For each element, select number of unique elements less than element
>> Count the length of the out put array
>> Return the count, either append to a new array and use `each` or output using `map`
(3) Return the array as the return value of the method


=end

def smaller_numbers_than_current(some_array)
  some_array.map do |n|
    some_array.select { |a| a < n}.uniq.length
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) \
                                      == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]
