=begin
A featured number (something unique to this exercise) is:
(1) an odd number
(2) a multiple of 7
(3) whose digits occur exactly once each.


So, for example, 49 is a featured number,
but 98 is not (it is not odd),
97 is not (it is not a multiple of 7), and
133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument,
and returns the next featured number that is greater than the argument.
Return an error message if there is no next featured number.
=end

=begin ##PEDAC
### Problem
Create a method that returns the next larger featured number given a number.
Input: a number
output: The next smallest featured number that is less than the input

Definitions:
Featured number is:
(1) odd
(2) multiple of 7
(3) digits only occur once

Assumptions
(1) if a number has more than 9 digits ( >= 1_000_000_000), we can immediately return :invalid because
a number of more than 9 digits has to repeat digits.

### Examples
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

### Algo
(1) Create a method to check if a number is featured
>> .odd? && % 7 == 0 && number.to_s.chars.uniq == number.to_s.chars
(2) begin loop
>> Starting with input number + 1, check if number is featured
>>>> if featured, break loop and return number
>>>> if not featured, add 1 to the number and go back to start of loop

=end

def is_featured?(some_num)
  some_num.odd? && \
  some_num % 7 == 0 && \
  some_num.to_s.chars.length == some_num.to_s.chars.uniq.length
end

def featured(num_input)
  if num_input >= 999_999_999
    return "No featured numbers exist above this number."
  else
    num_input += 1
    loop do
      break if is_featured?(num_input)
      num_input += 1
    end
    return num_input
  end
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999)

