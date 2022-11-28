

def letter_case_count(user_input)
  # lowercase = user_input.gsub(/[^a-z]/, '').length
  lowercase = user_input.count 'a-z'
  # uppercase = user_input.gsub(/[^A-Z]/, '').length
  uppercase = user_input.count 'A-Z'
  all_other = user_input.length - lowercase - uppercase
  output_hash = Hash.new
  output_hash[:lowercase] = lowercase
  output_hash[:uppercase] = uppercase
  output_hash[:neither] = all_other
  p output_hash
  output_hash

end



puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }