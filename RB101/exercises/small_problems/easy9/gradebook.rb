



def get_grade(a, b, c)
  avg = [a, b, c].sum/3.0
  case avg.to_s[0]
  when '9' then 'A'
  when '8' then 'B'
  when '7' then 'C'
  when '6' then 'D'
  else 'F'
  end
end





puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"