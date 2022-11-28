=begin
#### Problem Statement:
# Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.

# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0

#### Problem
Input: Two inputs, an array of positive integers and a single positive integer
Output: An integer

Explicit Requirements:
* Take the values within the input array and find the shortest subarray whose sum is greater than or equal to the integer input
* Subarray must be contiguous, which means that it must appear in the same order as the original array
* For example, array [1, 2, 3, 4] has contiguous subarrays [1], [1, 2, 3], [2, 3], etc.

Assumptions
* We do not need to worry about testing the validity of inputs - inputs will always be (1) an array of positive integers and (2) a single integer
* An array of a single element counts as an array (as per example #2)

#### Test Cases
# p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0

#### Data


#### Algorithm
(1) Find all contiguous subarrays of the array
>> find length of input array
>> Loop over array, each time slicing the array by length = 1, 2, 3 ... length of input array
>> store produced arrays into another array

(2) Sum all contiguous subarrays of the array
>> loop through each subarray in the meta-array to get the sum
>> output the sum and the array into another meta-array so we can keep track of which arrays sum to what
(3) Identify which subarrays sum >= input integer
>> loop through the meta-array from (2) and select arrays where the sum > reference integer
(4) Identify the subarray from part (3) which has the shortest length
>> loop through meta-array in (3), sort based on length, select the shortest array

(5) Output the length of the subarray identified in (4)

#### Code
=end

def find_subarrays(array_input)
  array_length = array_input.length
  length = 1
  subarrays = []
  while length <= array_length
    array_input.each_with_index do |n, index|
      subarrays << array_input[index...index+length]
    end
    length += 1
  end
  subarrays.uniq
end

def


