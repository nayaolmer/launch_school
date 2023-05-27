# write a class that makes an array fixed length
require "pry"
class FixedArray
  attr_accessor :length, :elements

  def initialize(length)
    @length = length
    @elements = [nil] * length
  end

  def []=(idx, obj)
    self[idx]
    elements[idx] = obj

  end

  def [](idx)
      elements.fetch(idx)
  end

  def to_a
    elements
  end

  def to_s
    elements.to_s
  end

end



fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'



puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'


# binding.pry
begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end