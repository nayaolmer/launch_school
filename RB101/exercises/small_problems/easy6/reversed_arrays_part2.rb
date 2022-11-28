=begin #### Problem Statement
Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

=end

# def reverse(user_input)
#   new_array = []
#   idx = user_input.length - 1
#   until idx < 0
#     new_array << user_input[idx]
#     idx -= 1
#   end
#   new_array
# end

def reverse(user_input)
  user_input.each_with_object([]) { |n, arr| arr.prepend(n) }
end


puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

