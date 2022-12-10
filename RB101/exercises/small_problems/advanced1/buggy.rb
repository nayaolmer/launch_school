def my_method(array)
  if array.empty?
    puts "It was empty"
    []
  elsif array.length > 1
    puts "Second conditional was triggered"
    array.map do |value|
      value * value
    end
  else
    puts "Third conditional was triggered"
    [7 * array.first]
  end
end

p my_method([]) # []
p my_method([3]) # [21]
p my_method([3, 4]) # [9, 16]
p my_method([5, 6, 7]) # [25, 36, 49]

# []
# [21]
# [9, 16]
# [25, 36, 49]