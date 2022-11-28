=begin
Write a method that takes one argument, 
a string, and returns a new string with the words in reverse order.
=end

require 'pry'
#### My solution below
def reverse_it(string_to_reverse)
  words_in_string = string_to_reverse.split(' ')
  words_in_string_reverse = words_in_string.reverse
  new_sentence = ""
  puts new_sentence
  words_in_string_reverse.each do |word|
    new_sentence = new_sentence + word + ' '
  end
  new_sentence = new_sentence.chomp(' ')
  return new_sentence
end

binding.pry

### Better solution

# def reverse_it(string_to_reverse)
#   string_to_reverse.split.reverse.join(' ')
# end
