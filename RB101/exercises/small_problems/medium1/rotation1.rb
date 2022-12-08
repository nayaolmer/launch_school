
# def rotate_array(arr)
#   first = arr.shift
#   arr << first
#   arr
# end

def rotate_array(arr)
  arr[1..-1] << arr[0]

end

def rotate_str(some_str)
  rotate_array(some_str.chars).join
end

def rotate_int(some_int)
  rotate_array(some_int.to_s.chars).join.to_i
end






puts rotate_str('abcde') == 'bcdea'
puts rotate_int(12345) == 23451







puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true