=begin
Given a string of words separated by spaces, write a method that takes this
string of words and returns a string in which the first and last letters of
every word are swapped.
=end

# def swap_chars(word_input)
#   chars = word_input.chars
#   first_letter = chars.shift
#   last_letter = chars.pop
#   chars.unshift(last_letter)
#   chars << first_letter
#   chars.join
# end

## OR

def swap_chars(word_input)
  word_input[0], word_input[-1] = word_input[-1], word_input[0]
  word_input
end




def swap(user_input)
  user_input.split.map { |word| swap_chars(word)}.join(' ')
end


puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
