# (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.


LETTERS = ('a'...'z').to_a
VOWELS = %w( a e i o u )
DOUBLED = LETTERS - VOWELS

def double_consonants(some_string)
  some_string.chars.map do |n|
    if DOUBLED.include?(n.downcase)
      n * 2
    else
      n
    end
  end.join
end




puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""