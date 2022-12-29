# p pairs([1, 2, 5, 6, 5, 2]) ==  2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) ==  4
# p pairs([0, 0, 0, 0, 0, 0, 0]) ==  3
# p pairs([1000, 1000]) ==  1
# p pairs([]) ==  0
# p pairs([54]) ==  0

def pairs(some_arr)
  sorted_arr = some_arr.sort
  ref_arr = sorted_arr.map(&:clone)

  pair_ct = 0

  i = 0
  while i < sorted_arr.length - 1
    if sorted_arr[i] == sorted_arr[i + 1]
      pair_ct += 1
      i += 2
    else
      i += 1
    end
  end
  pair_ct
end

p pairs([1, 2, 5, 6, 5, 2]) ==  2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) ==  4
p pairs([0, 0, 0, 0, 0, 0, 0]) ==  3
p pairs([1000, 1000]) ==  1
p pairs([]) ==  0
p pairs([54]) ==  0



