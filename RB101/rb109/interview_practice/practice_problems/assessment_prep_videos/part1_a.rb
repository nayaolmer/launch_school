=begin
####
Given a non-empty string, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase English letters only.

# Example 1:

# Input: "abab"
# Output: true

Test cases:
p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true

=end

=begin PEDAC

#### Understand the problem
You are given a string. The string may be a repeating pattern of a substring.
Your task is to determine if the string is, in fact, a repeating pattern of a substring.

Input: string
Output: true/false (is a repeated substring pattern, is not a repeated substring pattern)

Requirements/Assumptions
(1) A substring is any string of at least one character - eg, 'a' is a substring
>>> This means "aaa" IS a substring pattern
(2) We aren't dealing with anything non-alphabetical, and nothing upper case
(3) Substring can be repeated any number of times


#### Examples
p repeated_substring_pattern("abab") == true
>> Substring is "ab", no edge case
p repeated_substring_pattern("aba") == true
>> No substring repeated
p repeated_substring_pattern("aabaaba") == false
>> No substring repeated
p repeated_substring_pattern("abaababaab") == true
>> Substring is "abaab" << you may be surprised what the repeated substring is!
p repeated_substring_pattern("abcabcabcabc") == true
>> Substring is "abc"

#### Algo
(1) define new method, `repeated_substring_pattern` that accepts one input parameter, a string
(2) extract all available substrings from the String
>> Substrings will always start with the first letter and grow onwards
(3) eliminate substrings where input_string.length % substring.length != 0
(4) for remaining substrings, identify how many times they would need to be self-appended in order to be the same length as input String
(5) do all the appending
(6) Check if the newly formed string == input_string
(7) if true, return true

#### Code
=end

def extract_substrings(input_str)
  substrings = []
  i = 0
  until i == input_str.length - 1
    substrings << input_str[0...i+1]
    i += 1
  end
  substrings
end

def repeated_substring_pattern(some_str)
  substrings = extract_substrings(some_str)

  valid_substrings = substrings.select do |n|
                          (some_str.length % n.length == 0) && \
                          n * (some_str.length / n.length) == some_str
                        end
  valid_substrings.length > 0
end





#### Test Cases
p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true