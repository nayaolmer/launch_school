


def sequence(count, value)
  output = []
  print_value = value
  until count == 0
    output << print_value
    print_value += value
    count -= 1
  end
  output
end








puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []