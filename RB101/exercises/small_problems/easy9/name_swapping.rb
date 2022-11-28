


# def swap_name(some_name)
#   first, last = some_name.split[0], some_name.split[1]
#   "#{last}, #{first}"
# end

def swap_name(some_name)
  some_name.split.reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'