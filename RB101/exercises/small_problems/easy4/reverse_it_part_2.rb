=begin
Write a method that takes one argument, 
a string containing one or more words, 
and returns the given string with words 
that contain five or more characters reversed. 
Each string will consist of only letters and spaces. 
Spaces should be included only when more than one word is present.
=end

require 'pry'

## My solution

def reverse_it_2(string_to_reverse)
  words = string_to_reverse.split(" ")

  new_sentence = ""
  words.each do |n|
    if n.length < 5
      new_sentence = new_sentence + n + ' '
    else
      new_sentence = new_sentence + n.reverse + ' '
    end
  end

  new_sentence = new_sentence.chomp(" ")
  return new_sentence
end


## Their solution

def reverse_it_2_ls(string_to_reverse)
  words = []

  string_to_reverse.split(" ").each do |n|
    n.reverse! if n.length >= 5
    words << n 
  end

  words.join(" ")
end








binding.pry

