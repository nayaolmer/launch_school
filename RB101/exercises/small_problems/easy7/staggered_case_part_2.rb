

def staggered_case(user_input)
  letters = user_input.split('')
  output = []
  case_tracker = true
  letters.each do |n|
    if n =~ /[a-zA-Z]/ && case_tracker
      output << n.upcase
      case_tracker = !case_tracker
    elsif n =~ /[a-zA-Z]/ && !case_tracker
      output << n.downcase
      case_tracker = !case_tracker
    else
      output << n
    end
  end
  output.join
end

def staggered_case(user_input, care_about_non_alpha = true)
  letters = user_input.split('')
  output = []
  case_tracker = true
  if care_about_non_alpha
    letters.each do |n|
      if n =~ /[a-zA-Z]/ && case_tracker
        output << n.upcase
        case_tracker = !case_tracker
      elsif n =~ /[a-zA-Z]/ && !case_tracker
        output << n.downcase
        case_tracker = !case_tracker
      else
        output << n
      end
    end
  else
    letters.each do |n|
      if case_tracker
        output << n.upcase
        case_tracker = !case_tracker
      elsif !case_tracker
        output << n.downcase
        case_tracker = !case_tracker
      end
    end
  end
  output.join
end






puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'

puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'