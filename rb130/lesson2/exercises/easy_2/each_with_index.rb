


def each_with_index(some_array)
  idx_count = 0
  some_array.each do |item|
    yield(item, idx_count)
    idx_count += 1
  end
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]