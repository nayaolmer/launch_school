=begin
Write a method to find the longest common prefix string amongs an array of strings.

If there is no common prefix, return an empty string "".

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"

All given inputs are lower case a-z

=end

=begin PEDAC
#### Understand the problem
Our goal is to return the longest shared prefix of a list of strings. If no prefix is shared, return empty string ""
Input: a list of strings
Output: a string

Requirements/assumptions/edge cases
(1) If no common string is found, output ""
(2) we are only handling lowercase alphabetical letters
(3) If the words are the same, the full word is considered the shared longest prefix

#### Test cases
p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"
>> when strings are ==, return the full String

#### Algorithm
(1) define a new method, `common_prefix`, which accepts one input parameter, an array of strings
(2) Select the first element as our base element
(3) loop through each character of the base element, generating longer and longer substrings.
>>> For each substring, check if the first X elements match in the other elements of the list
>>> Break the loop once there is no longer a match
(4) return the substring before the loop broke

#### Code
=end

def common_prefix(some_arr)
  base = some_arr[0]
  i = 0
  longest_prefix = ""
  while i < base.length
    if some_arr.all? { |element| element[0..i] == base[0..i] }
      longest_prefix = base[0..i]
      i += 1
    else
      break
    end
  end
  longest_prefix
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"