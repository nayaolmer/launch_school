=begin
[1, 2, 3].each { |num| "do nothing"}
=end

def each(some_array)
  counter = 0
  loop do

    yield(some_array[counter])
    counter += 1
    break if counter == (some_array.length)
  end
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end

# 1
# 2
# 3
# 4
# 5
# => [1, 2, 3, 4, 5]