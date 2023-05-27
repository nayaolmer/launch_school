

def each_cons(some_array, it_size)
  idx_1 = 0
  idx_2 = idx_1 + (it_size - 1)


  while idx_2 < some_array.size
    # puts "idx1: #{idx_1}"
    # puts "idx2: #{idx_2}"
    # puts some_array[idx_1..idx_2]
    # puts yield(some_array[idx_1..idx_2])
    yield(*some_array[idx_1..idx_2])
    idx_1 += 1
    idx_2 += 1
  end

  return nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}