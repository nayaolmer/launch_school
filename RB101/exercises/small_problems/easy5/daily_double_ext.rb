

def crunch(user_input)
  characters = user_input.chars.uniq
  characters.each do |c|
    regex_to_use = "/#{c}+/"
    replace_with = "#{c}"
    puts regex_to_use
    puts replace_with
    user_input.gsub!(regex_to_use, replace_with)
  end
  puts user_input
end





crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''