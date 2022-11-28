
require "pry"


def is_double?(some_number)
  if some_number.to_s.length.odd?
    false
  else
    middle = some_number.to_s.length / 2
    some_number.to_s[0...middle] == some_number.to_s[middle..-1]
  end
end

def twice(user_input)
  if is_double?(user_input)
    user_input
  else
    user_input * 2
  end
end


# binding.pry





puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10