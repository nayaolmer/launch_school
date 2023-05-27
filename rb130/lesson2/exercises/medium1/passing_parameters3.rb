

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end


# gather(items) do | *produce, wheat |
#   puts *produce.join(', ')
#   puts wheat
# end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# gather(items) do | apples, *corn, wheat|
#   puts apples
#   puts *corn.join(', ')
#   puts wheat
# end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# gather(items) do | apples, *corn |
#   puts apples
#   puts *corn.join(', ')
# end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

gather(items) do | apples, corn, cabbage, wheat|
  puts "#{apples}, #{corn}, #{cabbage}, #{wheat}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!