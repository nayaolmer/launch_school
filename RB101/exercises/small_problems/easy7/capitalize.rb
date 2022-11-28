
# def word_cap(user_input)
#   user_input.split.map(&:capitalize).join(' ')
# end

def word_cap(user_input)

  user_input.split.each{|n| n[0] = n[0].upcase}.join(' ')
end



puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'