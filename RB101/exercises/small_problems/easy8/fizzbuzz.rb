
def fizzbuzz(a, b)
  output = []
  (a..b).to_a.each do |n|
    if n % 3 == 0 && n %5 == 0
      output << 'FizzBuzz'
    elsif n % 3 == 0
      output << 'Fizz'
    elsif n % 5 == 0
      output << 'Buzz'
    else
      output << n
    end
  end
  output.join(', ')
end










puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz