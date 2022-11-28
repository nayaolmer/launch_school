
### Palindrome must be at least two characters long

def leading_substrings(user_input)
  idx = 0
  substrs = []
  while idx < user_input.length
    substrs << user_input[0..idx]
    idx += 1
  end
  substrs
end

def substrings(user_input)
  output = []
  idx = 0
  while idx < user_input.length
    string_input = user_input[idx..-1]
    output << leading_substrings(string_input)
    idx += 1
  end

  output.flatten
end

def palindromes(some_string)
  clean_str = some_string.gsub(/[^a-zA-Z0-9]/, '')
  valid_substrs = substrings(clean_str).select { |n| n.length > 1 }
  # puts valid_substrs.select { |n| n == n.reverse }
  valid_substrs.select { |n| n == n.reverse }
end




puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]