=begin

Your program will take two inputs:
input 1: a string of numbers
input2: the length of substrings

Your goal is to output all the substrings of input1 of length input2


=end

require "pry"

class Series

  attr_reader :string_of_digits

  def initialize(string_of_digits)
    @string_of_digits = string_of_digits
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > string_of_digits.size
    slices = []
    i = 0
    until i > string_of_digits.size - slice_length
      slice = string_of_digits[i...i+slice_length].chars.map(&:to_i)
      slices << slice
      i += 1
    end
    slices
  end

end

# binding.pry