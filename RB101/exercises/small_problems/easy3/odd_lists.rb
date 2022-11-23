=begin
Write a method that returns an Array that contains every other element of an
Array that is passed in as an argument. The values in the returned list should
be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.
=end

require 'pry'

def oddities(array_input)
  new_arr = []
  array_input.each_with_index do |n, index|
    new_arr << n if index.even?
  end
  new_arr
end

def oddities(array_input)
  new_arr = []
  idx = 1

# def oddities(array_input)
#   idx = 1
#   new_arr = []
#   array_input.each_with_index do |n, index|
#     if index == idx
#       new_arr << n
#       idx += 2
#     end
#   end
#   new_arr
# end

# binding.pry

p oddities([2, 3, 4, 5, 6]) # == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) # == [1, 3, 5]
p oddities(['abc', 'def']) # == ['abc']
p oddities([123]) # == [123]
p oddities([]) # == []
p oddities([1, 2, 3, 4, 1]) # == [1, 3, 1]

