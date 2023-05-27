
require "pry"

class Series


  def initialize(some_string)
    @string_of_digits = some_string
  end

  def slices(specified_length)
    raise(ArgumentError) if (specified_length > @string_of_digits.size)
    # counter = 0
    # return_slices = []
    # array_size = @string_of_digits.size

    @string_of_digits.chars.map(&:to_i).each_cons(specified_length).to_a

    # array_size.times do
    #   end_index = counter + (specified_length - 1)
    #   string_slice = @string_of_digits[counter..end_index]
    #   return_slice = string_slice.chars.map(&:to_i)
    #   return_slices << return_slice
    #   counter += 1
    #   break if counter > (array_size - specified_length)
    # end

    # return return_slices
  end

end


# x = Series.new('01234')

# binding.pry