

def leading_substrings(user_input)
  idx = 0
  substrings = []
  while idx < user_input.length
    substrings << user_input[0..idx]
    idx += 1
  end
  substrings
end





puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']