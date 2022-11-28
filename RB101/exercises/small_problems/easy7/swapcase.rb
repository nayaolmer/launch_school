

def swapcase(user_input)
  user_input.chars.map do |n|
    if n =~ /[a-z]/
      n = n.upcase
    elsif n =~ /[A-Z]/
      n = n.downcase
    else
      n
    end
  end.join()
end



puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'