=begin
Write a method that takes one argument, a sentence string, 
and returns an array of integers. 
The value of each integer in the array should be equal 
to the length of the word in the corresponding position in the sentence. 
For example, if the sentence was 'To be or not to be' the array of integers 
would be [2, 2, 2, 3, 2, 2].
=end

def word_length_checker(sentence)
  # words = sentence.split(" ")
  # word_length = words.map {|word| word.length}
  # return word_length 
  # strings = sentence.split

  # strings.map { |chars| chars.length }
  # strings = sentence.split
  # lengths = []

  # strings.each do |string|
  #   lengths << string.size
  # end

  # return lengths
  # words = sentence.split
  # word_lengths = []
  # counter = 0

  # while counter < words.size do
  #   word_lengths << words[counter].length
  #   counter += 1
  # end

  # word_lengths
  strings = sentence.split
  lengths = []
  counter = 1

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

returned_value = word_length_checker("To be or not to be")

p returned_value