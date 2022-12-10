=begin
Write a program that reads the content of a text file and then prints the
longest sentence in the file based on number of words.
Sentences may end with periods (.), exclamation points (!), or question marks (?).
Any sequence of characters that are not spaces or sentence-ending characters
should be treated as a word. You should also print the number of words in the
longest sentence.
=end


=begin PEDAC

## Problem:
input: a text file
output:
(1) the sentence with the most words
(2) the number of words in the longest sentence in the text file

Definitions/Assumptions
(1) A word is any number of characters that are not spaces or sentence-ending characters.
>> This means '--' is a word

## Examples:
Hello -- my name is Naya Olmer. I like Cats.
The longest sentence is "Hello -- my name is Naya Olmer." It has 7 words.

## Algo
(1) Read text file
(2) Split text file into sentences using end punctuation - /[\.\!\?]
(3) Split each sentence into words using word boundaries \b
(4) Count the words in each sentence
(5) Store a hash with the sentence and it's word count
(6) Output the sentence in the hash with the greatest word count
(7) output the wordcount of that sentence

=end

require 'pry'

# def get_sentences(some_file)
#   file = File.open(some_file)
#   file_data = file.read.gsub(/[\n\r]/, ' ').gsub('  ', ' ')
#   sentences = file_data.split(/(?<=[\.\!\?])/)
#   sentences
# end

# def get_greatest_length_and_sentence(sentences)
#   greatest_length = 0
#   sentence_with_greatest_length = ''
#   sentences.each_with_index do |n, idx|
#     word_count = n.split(' ').length
#     if n.split(' ').length > greatest_length
#       greatest_length = n.split(' ').length
#       sentence_with_greatest_length = n
#     end
#   end
#   return greatest_length, sentence_with_greatest_length
# end


# def longest_sentence(some_file)
#   sentences = get_sentences(some_file)
#   greatest_length, sentence_with_greatest_length = get_greatest_length_and_sentence(sentences)
#   puts "The longest sentence is: #{sentence_with_greatest_length}."
#   puts "The longest sentence has #{greatest_length} words."
# end



### Answer

def longest_sentence(some_file)
  text = File.read(some_file)
  sentences = text.split(/(?<=[\.\!\?])/)
  largest_sentence = sentences.max_by {|sentence| sentence.split.length}
  largest_sentence = largest_sentence.strip
  word_ct = largest_sentence.split(' ').length

  puts "The longest sentence is: #{largest_sentence}."
  puts "The longest sentence has #{word_ct} words."
end

longest_sentence('ex_text.txt')
longest_sentence('pg84.txt')

def longest_paragraph(some_file)
  text = File.read(some_file)
  paragraphs = text.split(/\n\n/)
  largest_paragraph = paragraphs.max_by {|paragraph| paragraph.split.length}
  largest_paragraph = largest_paragraph.strip
  word_ct = largest_paragraph.split(' ').length
  puts "The longest paragraph is: #{largest_paragraph}."
  puts "The longest paragraph has #{word_ct} words."
end

longest_paragraph('ex_text.txt')
longest_paragraph('pg84.txt')
