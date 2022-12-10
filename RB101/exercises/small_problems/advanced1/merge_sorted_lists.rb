


def merge(a, b)
  c = a + b
  sorted_c = []
  loop do
    sorted_c << c.min
    c.delete_at(c.index(c.min))
    break if c == []
  end
  return sorted_c
end



a = [1, 5, 9]
b = [2, 6, 8]

sorted_c = []

a.each_with_index do |n, idx|
  b.each_with_index do |m, idx|
    sorted_c << m if m <= n
  end
  sorted_c << n
end

b.select { |n| !sorted_c.include? n}



puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]

