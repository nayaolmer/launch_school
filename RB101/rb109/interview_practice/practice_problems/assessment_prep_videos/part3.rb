=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4] == 6 # [4, -1, 2, 1]

# Easy case is when the array i smade up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made up of only negative numbers, return 0 instead.

# Empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray.

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

=end

=begin PEDAC
#### Understand the problem
The goal here is to return the greatest sum you can create from a subset of an input array of numbers. The trick here is that the array can contain both positive and negative numbers, so it's not like you can just take the sum of the whole array.

Input: an array of positive/negative numbers
Output: the greatest sum of a subset of numbers of the array OR 0 if all numbers of the array are negative.

Edge cases/assumptions/requirements
(1) If all elements of the array are < 0, return 0
(2) If the array is empty, also return 0

#### Examples/Test cases
p max_sequence([]) == 0
>>> If empty array, return zero
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
>>> Max sequence == [4, -1, 2, 1]
p max_sequence([11]) == 11
>>> An array of a single element is valid, return the number (if positive)
p max_sequence([-32]) == 0
>>> If only negative elements, return 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
>>> max sequence == [2, 1, 5, 4]

#### Algo
(1) Define new method, `max_sequence`, that takes in a single input parameter, an array of pos/neg integers
(2) handle returns of 0 first -
>> if all elements are negative (.all?), return 0
>> if list.length < 1, return 0
(3) handle non-zero returns
>> def method to extract/return all subarrays
>> Get an array that is each sum of all subarrays
>> return max of the array

## Code
=end

def extract_subs(ex_arr)
  subarrays = []
  start_idx = 0
  while start_idx < ex_arr.length
    end_idx = start_idx
    while end_idx < ex_arr.length
      subarrays << ex_arr[start_idx..end_idx]
      end_idx += 1
    end
    start_idx += 1
  end
  subarrays
end


def max_sequence(some_array)
  if some_array.all? {|element| element < 0}
    return 0
  elsif some_array.length < 1
    return 0
  else
    return extract_subs(some_array).map {|subarray| subarray.sum}.max
  end
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12


