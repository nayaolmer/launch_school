
def multiply_list(arr1, arr2)
  output = arr1.zip(arr2)
  output.each_with_index { |n, idx| output[idx] = n.inject(:*) }
end



puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]