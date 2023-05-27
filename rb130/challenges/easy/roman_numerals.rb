
=begin
I - 1
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1000


1900

1000 + 500 + 400

M + D + CCCC
MCM

1, 2, 3 >> additive
4 >> subtractive
5, 6, 7, 8 >> additive
9 >> subtractive
10 >> new value


1990

1000 = M
900 = 1000 - 100 = CM
90 = 100 - 10 = XC

MCMXC

2008
2000 = MM
8 = VIII
MMVIII
=end

=begin PEDAC
Goal: convert modern integer numbers into roman number equivalents

Assumptions
(1) don't have to worry about any numbers > 3000
(2) don't have to worry about non integers or negative numbers (or zero)

Test cases:
4 >> IV
8 >> VIII
9 >> IX
1990 >> MCMXC
2008 >> MMVIII

Algo:

get 1000's:

def build_number(base, larger, digit)
  if digit

  end

end

I - 1
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1000


ones: [I, V, X]
tens: [X, L, C]
hundreds: [C, D, M]

=end

# require "pry"

class RomanNumeral

  ONES_DICT = {0=>'', 1=>'I', 2=>'II', 3=>'III', 4=>'IV', 5=>'V', 6=>'VI', 7=>'VII', 8=>'VIII', 9=>'IX'}
  TENS_DICT = {0=>'', 1=>'X', 2=>'XX', 3=>'XXX', 4=>'XL', 5=>'L', 6=>'LX', 7=>'LXX', 8=>'LXXX', 9=>'XC'}
  HUNDREDS_DICT = {0=>'', 1=>'C', 2=>'CC', 3=>'CCC', 4=>'CD', 5=>'D', 6=>'DC', 7=>'DCC', 8=>'DCCC', 9=>'CM'}
  THOUSANDS_DICT = {0=>'', 1=>'M', 2=>'MM', 3=>'MMM'}

  attr_accessor :number, :roman

  def initialize(number)
    @number = number
    @roman = ''
  end


  def to_roman
    thousands = number / 1000
    hundreds = (number % 1000) / 100
    tens = (number % 100) / 10
    ones = (number % 10)
    rm_thousands = THOUSANDS_DICT[thousands]
    rm_hundreds = HUNDREDS_DICT[hundreds]
    rm_tens = TENS_DICT[tens]
    rm_ones = ONES_DICT[ones]
    roman = rm_thousands + rm_hundreds + rm_tens + rm_ones
    @roman = roman
    roman
  end
end






