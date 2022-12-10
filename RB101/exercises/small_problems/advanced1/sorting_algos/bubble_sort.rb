

def bubble_sort(array)
  original_array = array.map(&:clone)
  loop do
    i = 0
    while i < array.length - 1
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
      end
      i += 1
    end
    break if original_array == array
    original_array = array.map(&:clone)
  end
  return array
end


