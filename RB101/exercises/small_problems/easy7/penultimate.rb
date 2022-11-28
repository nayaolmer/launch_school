

def penultimate(user_input)
  user_input.split(' ')[-2]
end

def middle_word(user_input)
  words = user_input.split
  middle_idx = (words.length / 2.0).ceil - 1
  words[middle_idx]
end

middle_word("Happy Birthday To You")
middle_word("Happy Birthday To You Mara")


puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'