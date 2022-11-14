
## Increment every number by 1 without changing the data structure

arr = [[[1, 2], [3, 4]], [5, 6]]

arr.map do |subarr_1|
  subarr_1.map do |subarr_2|
    if subarr_2.is_a? Array
      subarr_2.map do |n_1|
        n_1 += 1
      end
    else
      subarr_2 += 1
    end
  end
end










# [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
#   p element1
#   element1.each do |element2|
#     p element2
#     element2.partition do |element3|
#       p element3
#       element3.size > 0
#     end
#   end
# end
# # => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
























# ## where we only want to select integers greater than 13 but strings less than 6 characters

# arr = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]

# x = arr.map do |subarr| 
#     subarr.select do |ii|
#       if ii.is_a? Integer
#         ii > 13
#       elsif ii.is_a? String
#         ii.length < 6
#       end
#     end
#   end

# p x
# ### I think this will return [[27], ['apple']]








































# ## sort the array in numerical sorting order

# arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]


# x = arr.map do |n|
#   n.map do |i|
#     i.to_i
#   end
# end

# p x

# y = x.sort!.map do |n|
#   n.map do |i|
#     i.to_s
#   end
# end

# p y

# ## Better way:

# arr.sort_by do |sub_arr|
#   sub_arr.map do |num|
#     num.to_i
#   end
# end



