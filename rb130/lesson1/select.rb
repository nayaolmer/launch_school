
array = [1, 2, 3, 4, 5]

p array.select {|n| n.odd?}


def select(some_array)
  return_array = []
  counter = 0
  loop do
    return_array << some_array[counter] if yield(some_array[counter])
    counter += 1
    break if counter == some_array.length
  end
  return_array
end

p select(array) {|n| n.odd?}
