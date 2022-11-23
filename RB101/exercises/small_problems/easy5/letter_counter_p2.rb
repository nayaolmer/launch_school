=begin
Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.
=end

def word_sizes(user_input)
  counts_hash = Hash.new(0)
  user_input.split.each do |word|
    counts_hash[word.delete(/[^a-zA-Z]/).length] += 1
  end
  counts_hash
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
