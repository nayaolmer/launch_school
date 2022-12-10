


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




def return_atomic_units(arr)
  return arr if arr.length == 1

  a = arr[0, arr.length/2]
  b = arr[arr.length/2, arr.length - 1]

  a = return_subarrays(a)
  b = return_subarrays(b)
  merge(arr_a, arr_b)

end

def merge(arr_a, arr_b)
  arr_c = arr_a + arr_b
  sorted_arr_c = bubble_sort(arr_c)
  return sorted_arr_c
end










merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]







