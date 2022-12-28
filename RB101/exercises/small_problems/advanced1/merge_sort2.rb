def merge_sort(arr)
  return arr if arr.length == 1
  half = arr.length/2
  a = arr[0, half]
  b = arr[half, arr.length - 1]
  a = merge_sort(a)
  b = merge_sort(b)
  return merge(a, b)
end

def merge(a, b)
  new_array = []
  until a.length == 0 || b.length == 0
    # puts a[0]
    # puts b[0]
    if a[0] <= b[0]
      new_array << a.shift
    else
      new_array << b.shift
    end
  end

  if a.length != 0 and b.length != 0
    puts "Something went wrong."
  elsif a.length != 0
    new_array = new_array + a
  elsif b.length != 0
    new_array = new_array + b
  end
  return new_array
end

puts merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts merge_sort([5, 3]) == [3, 5]
puts merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]





