=begin
Write a method that counts the number of 
occurrences of each element in a given array.
=end

require "pry"

x = [1, 2, 4, 3, 2, 1, 5, 6, 2, 4, 1, 2, 3]

counts = Hash.new

def how_many(input_array)
  counts = Hash.new
  input_array.uniq do |n|
    counts[n] = input_array.count(n)
  end
  puts "Values of the array and their counts: "
  puts counts.inspect
  return counts
end

binding.pry
