


def group_anagrams(words)
  basis = words.map {|n| n.chars.sort.join }
  dict = {}
  basis.each { |n| dict[n] = []}

  words.each do |n|
    sorted = n.chars.sort.join
    dict[sorted] << n
  end

  dict

end




example =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

puts group_anagrams(example)








