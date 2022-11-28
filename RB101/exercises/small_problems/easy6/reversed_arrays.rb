=begin ### Problem Statement
Write a method that takes an Array as an argument, and reverses its elements in place;
that is, mutate the Array passed into this method.
The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

=end

def reverse!(array_input)
  idx_up = (0...array_input.length).to_a
  until idx_up.length <= 1
    a = idx_up.shift
    b = idx_up.pop
    array_input[a], array_input[b] = array_input[b], array_input[a]
  end
  array_input
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true