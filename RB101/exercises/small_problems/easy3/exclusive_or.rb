=begin
takes two arguments, and returns true if exactly one of its arguments is truthy,
false otherwise. Note that we are looking for a boolean result instead of a
truthy/falsy value as returned by || and &&.
=end

def xor?(arg1, arg2)
  if arg1 && !arg2
    true
  elsif !arg1 && arg2
    true
  else
    false
  end
end

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
