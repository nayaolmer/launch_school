=begin
You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:

# 12 ==> 21
# 513 ==> 531
# 2017 -- 2071
# If no bigger number can be composed using those digits, return -1:
# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

=end
=begin PEDAC
## Understand the problem
The goal here is to create the next largest number based on the digits of an input number. If the input number is the largest form of the digits, return -1

Input: some positive integer
Output: the next larger digit or -1

Assumptions:
(1) Input will always be a positive integer

## Examples/Test cases
# puts next_bigger_number(12) == 21
# puts next_bigger_number(513) == 531
# puts next_bigger_number(2017) == 2071
# puts next_bigger_number(9) == -1
# puts next_bigger_number(111) == -1
# puts next_bigger_number(531) == -1

## Algorithm
(1) Define new method, `next_bigger_number` that accepts one input parameter, a positive integer
(2) Split the input integer into its component digits
(3) Get all permutations of digits
(4) sort the permutations of digits
(5) Get the difference between the permutation and the original digit
(6) select the permutation with the smallest difference
(7) return the selected permutation

=end

def next_bigger_number(some_int)
  input_digits_chars = some_int.to_s.chars
  input_digits_sorted = input_digits_chars.map {|char| char.to_i}.sort.reverse
  largest_number = input_digits_sorted.map {|digit| digit.to_s}.join.to_i

  testing_array = ((some_int+1)..largest_number).to_a
  potential_matches = testing_array.select do |num|
    sorted_num_elements = num.to_s.chars.map {|char| char.to_i}.sort.reverse
    sorted_num_elements == input_digits_sorted
    end
  if potential_matches.length < 1
    return -1
  else
    potential_matches[0]
  end
end


puts next_bigger_number(12) == 21
puts next_bigger_number(513) == 531
puts next_bigger_number(2017) == 2071
puts next_bigger_number(9) == -1
puts next_bigger_number(111) == -1
puts next_bigger_number(531) == -1





