






def balanced?(some_str)
  para_ct = 0
  some_str.each_char do |n|
    para_ct += 1 if n == '('
    para_ct -= 1 if n == ')'
    break if para_ct < 0
  end

  para_ct.zero?
end





















puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false