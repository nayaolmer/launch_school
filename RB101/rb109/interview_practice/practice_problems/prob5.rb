=begin
# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# Examples:

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".
=end

=begin PEDAC
#### Understanding the problem
Our goal is to find the least common character in a string. If there are multiple characters that occur the same (least) amount of times, return the one that appears first in the string.
Input: a string
Output: the first-occuring character that occurs the least often


Assumptions/edge cases/requirements
(1) consider uppercase characters the same as lowercase characters
(2) Return the lowercase version of the character
(3) characters include any character, including punctuation, numbers, etc.

#### Test cases
p least_common_char("Hello World") #== "h"
>>> return lower case version of letter
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
>>> return lower case version of letter
p least_common_char("Happy birthday!") #== ' '
>>> non alphanumeric characters, like " " count
p least_common_char("aaaaaAAAA") #== 'a'

#### Algorithm
(1) define new method, `least_common_char` that takes in one input parameter, a string
(2) convert string to downcase
(3) create variable, 'lst_com_char', and 'lst_com_char_ct', and set initial conditions to first character of down case string and it's Continuation
(4) loop through all characters in string. Count value of characters in string. if value < lst_com_char_ct, set lst_com_char_ct = value and lst_com_char = char
(5) return lst_com_char

#### Code
=end
def least_common_char(some_str)
  str_lower = some_str.downcase

  lst_com_char = str_lower[0]
  lst_com_char_ct = (str_lower.gsub(/[^#{lst_com_char}]/, '')).length

  i = 0
  while i < str_lower.length
    char = str_lower[i]
    ct = (str_lower.gsub(/[^#{char}]/, '')).length
    if ct < lst_com_char_ct
      lst_com_char_ct = ct
      lst_com_char = str_lower[i]
    end
    i += 1
  end

  lst_com_char
end


p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'


