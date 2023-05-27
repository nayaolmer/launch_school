

=begin

# we want to convert a base-10 number to a base-8 number.

The algorithm is simple.

multply the digit in the Xth place by 8^(xth - 1) number

Our algo:
(1) Get a number as input
(2) convert to string
(3) reverse the number
(4) split into chars
(5) iterate over each digit with idx, converting to int first and then multiplying
the digit by (8^(idx))
(6) push the digit to a list
(7) sum the list

=end


class Octal
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def is_number?(obj)
    clean_obj = obj.sub(/^[0]+/, '')
    clean_obj.to_s == clean_obj.to_i.to_s
  end

  def is_octal?(obj)
    is_number?(obj) && obj.to_s.chars.all? {|n| n.to_i < 8}
  end

  def to_decimal
    digits = []
    if is_octal?(number)
      number.to_i.to_s.reverse.chars.each_with_index do |n, idx|
        digits << (n.to_i * (8**idx))
      end
    else
      digits << 0
    end
    digits.sum
  end

end

