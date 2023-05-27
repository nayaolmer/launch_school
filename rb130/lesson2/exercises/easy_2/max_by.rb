

def max_by(some_array)
  return nil if some_array.size == 0
  largest_value = yield(some_array[0])
  largest_value_idx = 0
  some_array.each_with_index do |item, idx|
    if yield(item) > largest_value
      largest_value = yield(item)
      largest_value_idx = idx
    end
  end
  some_array[largest_value_idx]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil