



def egyptian(user_input)
  denom = 1
  egypt = []

  remainder = user_input

  until remainder == 0
    next_egypt = Rational(1, denom)
    until remainder - next_egypt >= 0
      denom += 1
      next_egypt = Rational(1, denom)
    end
    egypt << denom
    remainder -= next_egypt
    denom += 1
  end
  egypt
end


def unegyptian(user_input)
  total = 0
  user_input.each do |d|
    total += Rational(1, d)
  end
  total
end






puts egyptian(Rational(2, 1))    == [1, 2, 3, 6]
puts egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
puts egyptian(Rational(3, 1))    == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

puts unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
puts unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
puts unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
puts unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
puts unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
puts unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
puts unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
puts unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
