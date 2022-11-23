=begin
Write a method that takes a string argument and returns a new string
that contains the value of the original string with all consecutive
duplicate characters collapsed into a single character.

You may not use String#squeeze or String#squeeze!

=end


def crunch(user_input)
  output = ''
  user_input.chars.each_with_index do |n, index|
    output << n if user_input.chars[index] != user_input.chars[index+1]
  end
  output
end


## Examples

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''