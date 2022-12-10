=begin

### Problem
Given a list of character pairs, determine if a word is created by no more than one
of each pairs.

input: a word
output: true/false

Returns True if only letters from half the block are used AND if each block is only used once
Returns False if two letters from one block are used OR a block is used more than once

### Examples
block_word?('BATCH') == true
block_word?('BUTCH') == false << false because U:H are in a batch together
block_word?('jest') == true << note that we don't care about case

### Algo

(1) split a word into letters
(2) Iterate through pairs
>> for each pair, check if letters exist for both letters in the pair
>> if true, set return value to false and break the loop

=end

# LETTER_PAIRS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
#                 ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
#                 ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

# def block_word?(some_str)
#   letters = some_str.upcase.chars
#   output = ''
#   LETTER_PAIRS.each do |pair|
#     if (pair & letters) == pair
#       output = false
#     end
#     output = true if output == ''
#   end
#   output = false if letters.uniq < letters.count
#   output
# end

# puts block_word?('BATCH') == true
# puts block_word?('BUTCH') == false # << false because U:H are in a batch together
# puts block_word?('jest') == true # << note that we don't care about case


### Answer
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze
def block_word?(some_str)
  word = some_str.upcase
  BLOCKS.none? { |block| word.count(block) >= 2 }
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false # << false because U:H are in a batch together
puts block_word?('jest') == true # << note that we don't care about case