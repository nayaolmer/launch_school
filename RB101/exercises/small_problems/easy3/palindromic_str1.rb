=begin
Write a method that returns true if the string passed as an argument is a palindrome,
false otherwise. A palindrome reads the same forward and backward.
For this exercise, case matters as does punctuation and spaces.
=end

def palindrome?(string_input)
  string_input == string_input.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

## Further exploration

## Write a method that determines if an array is palindromic
def palindrome?(array_input)
  array_input == array_input.reverse?
end

