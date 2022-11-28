


# def multiply_all_pairs(arr1, arr2)
#   idx1 = 0
#   pairs = []
#   while idx1 < arr1.length
#     n = arr1[idx1]
#     idx2 = 0
#     while idx2 < arr2.length
#       pairs << [n, arr2[idx2]]
#       idx2 += 1
#     end
#     idx1 += 1
#   end

#   pairs.map { |n| n.inject(:*)}.sort



# end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |a, b| a * b }.sort
end






puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]