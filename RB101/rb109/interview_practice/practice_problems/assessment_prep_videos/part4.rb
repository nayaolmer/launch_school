=begin
 Given 2 strings, your job is to find out if there is a substring that appears in both strings. You will return true if you find a substring that appears in both strings, or false if you do not. We only care about substrings that are longer than one letter long

  p substring_test('Something', 'Fun') == false
  p substring_test('Something', 'Home') == true
  p substring_test('Something', '') == false
  p substring_test('', 'Something') == false
  p substring_test('BANANA', 'banana') == true
  p substring_test('test','lllt') == false
  p substring_test('', '') == false
  p substring_test('1234567','541265') == true
  p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou')
=end
=begin PEDAC
#### Understand the problem
Given two strings, our goal is to see if the two strings share a common substring, which we define as any string of length 2 characters or more.
Input: Two separate strings
Output: true/false

Requirements/Assumptions/Edge Cases
(1) If one of the input string is an empty string, the output will automatically base false (because the substring must be 2 or more characters in length and '' therefore has no substrings)
(2) Case is irrelevent

#### Examples/Test Cases
p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
>> "ome" is the matching substring
p substring_test('Something', '') == false
>> if one of the strings is '', return false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
>> Case is irrelevent
p substring_test('test','lllt') == false
>> substring must be more than one character in length
p substring_test('', '') == false
p substring_test('1234567','541265') == true
>> Numbers count as strings
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
>> case doesn't matter

#### Algo
(1) define a new method, `substring_test`, which takes two input parameters, both strings
(2) identify the shorter string. If strings are of equal length, take the first string
(3) identify all possible substrings from the shorter string << this may be a new method
(4) check if the longer string contains any of the shorter string's substrings
(5) If true, return true, if false return false

#### Code
=end



def get_substrings(some_str)
  home_string = some_str.downcase

  substrings = []
  start_idx = 0
  while start_idx < home_string.length - 1
    end_idx = start_idx + 1 ## Substring must be at least 2 chars in length
    while end_idx < home_string.length
      substrings << home_string[start_idx..end_idx]
      end_idx += 1
    end
    start_idx += 1
  end

  substrings
end

def substring_test(str_1, str_2)
  if str_1.length <= str_2.length
    substrings = get_substrings(str_1)
    substrings.any? do |substring|
      str_2.downcase.include? substring
    end
  else
    substrings = get_substrings(str_2)
    substrings.any? do |substring|
      str_1.downcase.include? substring
    end
  end
end


p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test','lllt') == false
p substring_test('', '') == false
p substring_test('1234567','541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou')