

# def real_palindrome?(string_input)
#   letters_to_keep = %w(a b c d e f g h i j k l m n o p q r s t u v w x)
#   new_string = string_input.downcase.chars.select { |n| letters_to_keep.include? n}
#   new_string == new_string.reverse
# end

def real_palindrome?(string_input)
  new_string = string_input.downcase.delete('^a-z0-9')
  new_string == new_string.reverse
end


puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false


