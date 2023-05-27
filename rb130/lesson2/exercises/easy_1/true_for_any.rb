

# def any?(some_array)
#   counter = 0
#   return_value = ''
#   loop do
#     if some_array.size == 0
#       return false
#       break
#     end
#     if yield(some_array[counter])
#       return_value = true
#       break
#     end
#     counter += 1
#     if counter == some_array.size
#       return_value = false
#       break
#     end

#   end
#   # puts "Return value: #{return_value}"
#   return_value
# end


def any?(collection)
  collection.each { |item| return true if yield(item)}
  false
end



p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
