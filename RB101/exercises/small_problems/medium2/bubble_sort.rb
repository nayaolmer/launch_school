

def bubble_sort!(some_array)

  loop do
    new_array = some_array.map(&:clone)
    some_array.each_with_index do |n, idx|
      if idx < some_array.length - 1
        if some_array[idx] > some_array[idx + 1]
          some_array[idx], some_array[idx + 1] = some_array[idx + 1], some_array[idx]
        end
      end
    end
    break if new_array == some_array
  end
end


array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)