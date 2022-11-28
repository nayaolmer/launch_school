

def halvsies(arr)
  len = arr.length
  idx_end = (len / 2.0).ceil
  first_half = arr[0...idx_end]
  second_half = arr[idx_end..-1]
  [first_half, second_half]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]