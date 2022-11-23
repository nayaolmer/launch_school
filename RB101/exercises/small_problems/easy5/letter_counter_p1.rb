=begin
Write a method that takes a string with one or more space separated
words and returns a hash that shows the number of words of different sizes.
=end

example_string = "This is a string"

# def word_sizes(user_input)
#   length_array = user_input.split.map { |n| n.length }
#   length_hash = {}
#   length_array.each { |n| length_hash[n] = length_array.count(n)}

#   length_hash
# end

def word_sizes(user_input)
  counts_hash = Hash.new(0)
  user_input.split.each do |word|
    counts_hash[word.length] += 1
  end
  counts_hash
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}




