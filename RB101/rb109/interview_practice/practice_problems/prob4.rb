=begin
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".
=end

=begin PEDAC
#### Understanding the problem
Our goal is to return the two numbers that are closest in value given an array of integers.

Input: array of integers
output: array of two integers - the two numbers that are closest in value from the input array

Assumptions/requirements/edgecases
(1) Assume that we will always be given an array of at least 2 integers
(2) Assume that if there are multiple numbers with the same difference, we will return the smallest two numbers << This is a bad assumption


#### Test Cases
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
>>> 25 & 27 are not neighbors, so we can find numbers that are closest to each other regardless of location
p closest_numbers([12, 7, 17]) == [12, 7]


#### Algorithm
(1) define a new method, `closest_numbers` with one input parameter, an array of integers
(2) Sort the input array from smallest to largest
(3) Create an array, `smallest_difference_numbers` and `smallest_difference`
>>> set initial conditions to two first values of array

(4) loop through the array
>> Calculate the difference between each number
>> If difference < smallest_difference, set smallest_difference to new difference and set smallest_difference_numbers to the two numbers
(5) Get the index of each number by using `.find_index(number)`
(6) Sort the indexs smallest to largest
(7) reference the numbers via the index to produce the proper array output

#### Code
=end

def closest_numbers(some_arr)
  some_arr_sorted = some_arr.sort

  smallest_difference_numbers = some_arr[0..1]
  smallest_difference = (some_arr[0] - some_arr[1]).abs

  i = 0
  while i < some_arr_sorted.length - 1
    delta = (some_arr_sorted[i] - some_arr_sorted[i + 1]).abs
    if delta < smallest_difference
      smallest_difference = delta
      smallest_difference_numbers = some_arr_sorted[i..(i+1)]
    end
    i += 1
  end

  indexes = smallest_difference_numbers.map { |num| some_arr.find_index(num) }
  indexes.sort!

  [some_arr[indexes[0]], some_arr[indexes[1]]]
end


p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]


