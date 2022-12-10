

def selection_sort!(array)
  i = 0
  while i < array.length
    j = i + 1
    current_min = array[i]
    min_idx = nil
    while j < array.length
      if array[j] < current_min
        current_min = array[j]
        min_idx = j
      end
      j += 1
    end
    array[i], array[min_idx] = array[min_idx], array[i] if !min_idx.nil?
    i += 1
  end
  array
end

## First challenge: traverse the array
a = [64, 25, 12, 22, 11]
p selection_sort!(a)


