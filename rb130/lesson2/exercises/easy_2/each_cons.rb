


def each_cons(some_array)
  idx_1 = 0
  idx_2 = 1

  while idx_2 < some_array.size
    yield(some_array[idx_1], some_array[idx_2])
    idx_1 += 1
    idx_2 += 1
  end

  return nil
end


hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil