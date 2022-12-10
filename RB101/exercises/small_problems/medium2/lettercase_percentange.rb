=begin
Write a method that takes a string, and then returns a hash that contains 3 entries:
one represents the percentage of characters in the string that are lowercase letters,
one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.
=end

def letter_percentages(some_str)
  length = some_str.chars.length
  count_hash = {}
  count_hash[:lowercase] = ((some_str.scan(/[a-z]/).length / length.to_f) * 100).round(1)
  count_hash[:uppercase] = ((some_str.scan(/[A-Z]/).length / length.to_f) * 100).round(1)
  count_hash[:neither] = ((some_str.scan(/[^a-zA-Z]/).length / length.to_f) * 100).round(1)
  puts count_hash
  return count_hash
end



puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }