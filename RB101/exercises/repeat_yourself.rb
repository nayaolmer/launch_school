#Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

require 'pry'

def repeat_myself(str_to_repeat, number_of_repetitions)
  number_of_repetitions.times { puts str_to_repeat}
end

binding.pry
