=begin
Find the length of the longest substring in the given string that is the same in reverse.

longest_palidrome("I like racecars that go fast") == 7 #racecar is the longest palidrome, its length is 7

Test cases:

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9

=end

=begin PEDAC
#### Understanding the problem
The goal here is to find the length of the longest palindromic substring within a string.
Input: a string
Output: an integer, the length of the longest palindromic substring

Edgecases/Assumptions/Requirements
(1) A substring is considered any string of length 1 or more
(2) Substrings must be in the same order as presented in the input - I cannot rearrange characters to produce new substrings
(3) Inputs are alphanumeric

#### Test Cases
p longest_palindrome("a") == 1
>>> substring can be of length 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
>>> Palindrome is "aa"
p longest_palindrome("aab") == 2
>>> Palindrome is "aa"
p longest_palindrome("baabcd") == 4
>>> Palindrome is "baab"
p longest_palindrome("baablkj12345432133d") == 9
>>> Palindrome is "123454321"

#### Algorithm
(1) Define new function, `longest_palindrome` that accepts one input parameter, a string
(2) extract all substrings from string <<< This will likely be a different function
(3) Check which of the substrings are palindromic <<< could also be a different function
(4) find the max length of the palindromic substrings
(5) return the max length

#### Code

=end



def extract_substrings(the_str)
  substrings = []
  start_idx = 0
  while start_idx < the_str.length
    end_idx = start_idx
    while end_idx < the_str.length
      substrings << the_str[start_idx..end_idx]
      end_idx += 1
    end
    start_idx += 1
  end
  substrings
end

def is_palindrome?(ex_str)
  ex_str.reverse == ex_str
end

def longest_palindrome(some_str)
  substrings = extract_substrings(some_str)
  palindromes = substrings.select { |substring| is_palindrome?(substring) }
  max_length = palindromes.map { |palindrome| palindrome.length }.max
  if max_length
    return max_length
  else
    return 0
  end
end


p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
p longest_palindrome("") == 0









