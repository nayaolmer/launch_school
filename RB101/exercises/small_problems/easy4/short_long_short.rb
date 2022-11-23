=begin
Write a method that takes two strings as arguments,
determines the longest of the two strings,
and then returns the result of concatenating
the shorter string, the longer string, and the shorter string once again.
You may assume that the strings are of different lengths.
=end

def short_long_short(string1, string2)
  if string1.length < string2.length
    "#{string1}#{string2}#{string1}"
  elsif string2.length < string1.length
    "#{string2}#{string1}#{string2}"
  end
end


## Examples

puts short_long_short("hello", "you") == "youhelloyou"

