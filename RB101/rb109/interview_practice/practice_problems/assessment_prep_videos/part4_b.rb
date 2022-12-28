=begin
Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false
For example:
scramble('rkqodlw', 'world') == true
scramble('cedwaraaossoqqyt', 'codewars') == true
scramble('katas', 'steak') == false

Only lower case letters will be used (a-z). No punctuation or digits will be included.

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw','world') == true
p scramble('cedwaraaossoqqyt', 'codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true
=end

=begin PEDAC
#### Understand the problem
We receive two strings as input. Our goal is to identify if the second string's characters can be found in the first string.
input: two strings
output: true/false

Requirements/assumptions/edge cases
(1) To return true, the first string must contain all the characters (in equal quantity) of the second string
(2) We're only dealing with lower case alphabetical characters

#### Test casesp
scramble('javaass', 'jjss') == false
>>> False because str1 has only 1 'j'
p scramble('rkqodlw','world') == true
p scramble('cedwaraaossoqqyt', 'codewars') == true
p scramble('katas','steak') == false
>>> False because str1 does not contain 'e'
p scramble('scriptjava','javascript') == true
p ('scriptingjava','javascript') == true

#### Algorithm
(1) def new method, `scramble` that takes two input parameters, both strings
(2) One path:
(3) character by character, check if str1 contains each character of str2
(4) If true, remove the character from str2 using sub! <<< note that this mutates the caller which could be an issue, if yes use .clone to create a copy that doesn't mutate the original array
(5) if all true, then return true. Else return false

#### Code

=end

def scramble(str1, str2)
  answ = str2.chars.all? do |char|
          if str1.include? char
              str1.sub!(char, '')
              true
          else
            false
          end
        end
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw','world') == true
p scramble('cedwaraaossoqqyt', 'codewars') == true
p scramble('katas','steak') == false
p scramble('scriptjava','javascript') == true
p scramble('scriptingjava','javascript') == true

