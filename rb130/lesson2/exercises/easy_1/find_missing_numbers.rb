def missing(some_array)
  counter = 0
  output = []
  while counter < some_array.size - 1
    element1 = some_array[counter]
    element2 = some_array[counter + 1]
    if (element1 - element2).abs != 1
      output << (element1..element2).to_a[1..-2]
    end
    counter += 1
  end
  output.flatten
end


def missing(some_array)
  output = []
  some_array.each_cons(2) do |n1, n2|
    output.concat(((n1+1)..(n2-1)).to_a)
  end
  output
end


p missing([-3, -2, 1, 5]) # == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) # == []
p missing([1, 5]) # == [2, 3, 4]
p missing([6]) # == []