=begin
Write a method that takes an Array of Integers between 0 and 19,
and returns an Array of those Integers sorted based on
the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten,
eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

=end

# def alphabetic_number_sort(user_input)
#   numbers = (0..19).to_a
#   words = %w(zero one two three four five six seven eight nine ten
#               eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

#   numbers_words_dict = {}
#   i = 0
#   while i < 20
#     numbers_words_dict[numbers[i]] = words[i]
#     i = i + 1
#   end

#   language_numbers = user_input.map { |n| numbers_words_dict[n] }.sort

#   output_numbers = language_numbers.map {|n| numbers_words_dict.key(n)}

# end


def alphabetic_number_sort(user_input)
  words = %w(zero one two three four five six seven eight nine ten
                eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

  # user_input.sort_by { |n| words[n]}
  user_input.sort {|a, b| words[a] <=> words[b]}
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]



