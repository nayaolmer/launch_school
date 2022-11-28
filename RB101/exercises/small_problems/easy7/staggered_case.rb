

def staggered_case(user_input, which_word = 'first')
  x = user_input.split('')
  if which_word == 'first'
    x.each_with_index do |n, idx|
      if idx.odd?
        x[idx] = n.downcase
      else
        x[idx] = n.upcase
      end
    end.join('')
  else
    x.each_with_index do |n, idx|
      if idx.even?
        x[idx] = n.downcase
      else
        x[idx] = n.upcase
      end
    end.join('')
  end
end



puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS', 'second') == 'aLl_cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'