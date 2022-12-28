=begin
# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

= end

=begin PEDAC
#### Understanding the problem
The goal here is to take a string and convert every 2nd letter in every 3rd word to upcase.

Assumptions/Requirements/Edgecases
(1) If the 3rd word already has every 2nd letter upcase, keep them upcase, don't downcase them
(2) If there is no 3rd word, just return the string as is
(3) If the third word is only one letter, do not perform any upcase to it
(4) Don't change the case of any other letters
(5) assume there are only alphabetical characters in the string, no punctuation marks, words are only separated by ' '

#### Test cases
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

#### Algorithm
(1) defining a new method, `to_weird_case`, which accepts one input parameter, a string
(2) Split the string into words
(3) Pull out third words by checking if the (index + 1) % 3 == 0
>> convert every second letter of this third word to upcase -- (idx + 1) % 2 == 0
(4) join words with " "
(5) return new string

#### Code
=end

def to_weird_case(some_str)
  words = some_str.split
  new_words = []
  words.each_with_index do |word, idx|
    if (idx + 1) % 3 == 0
      new_word = ''
      word.chars.each_with_index do |char, idx|
        if (idx + 1) % 2 == 0
          new_word << char.upcase
        else
          new_word << char
        end
      end
      new_words << new_word
    else
      new_words << word
    end
  end

  new_words.join(' ')
end


p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'