

=begin


2 inputs:
input 1: a natural number (a positive whole number)
input 2: a set of one or more other numbers

Goal:
(1) find the sum of all the multiples of the numbers in the set that are less than the first number


Algo:
(1) take the numbers of the set
(2) for each number, multiply them by 1, 2, 3, 4, 5 .... up until the value <= input 1
(3) store these values in an array
(4) sum these values


Edge cases we need to account for:
(1) if input2 is nil, set it equal to [3, 5]

=end

class SumOfMultiples

  attr_reader :input2

  def initialize(*input2)
    @input2 = (input2.size > 0) ? input2 : [3, 5]
  end

  def to(input1)
    multiples = []
    input2.each do |num|
      limit = input1/num
      limit.times do |x|
        multiple = (x + 1) * num
        multiples << multiple if multiple < input1
      end
    end
    multiples.uniq.sum
  end

  def self.to(input)
    SumOfMultiples.new().to(input)
  end





end
