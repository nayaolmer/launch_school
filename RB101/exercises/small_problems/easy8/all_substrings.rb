

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








puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]