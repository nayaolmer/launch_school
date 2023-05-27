# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# birds = [1, 2, 3, 4]

# def some_method(some_array)
#   yield(some_array)
# end

# some_method(birds) { |_, _, *raptors| puts raptors}


items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *part1 , part2|
  puts part1.join(', ')
  puts part2
end

gather(items) do | a, *b, c |
  puts a
  puts b.join(', ')
  puts c
end

gather(items) do |a, *b|
  puts a
  puts b.join(', ')
end


gather(items) do |a, b, c, d|
  puts "#{a}, #{b}, #{c}, #{d}"
end




# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!