

require "pry"

class RomanNumeral

  DIGITS_ARRAY = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  TENS_PLACES = ['ones','tens','hundreds','thousands']
  LETTERS_ARRAY = [['I','V','X'],
                   ['X', 'L', 'C'],
                   ['C', 'D', 'M'],
                   ['M', '', '']]
  LETTERS_DICT = Hash[TENS_PLACES.zip(LETTERS_ARRAY)]

  attr_accessor :integer_number

  def initialize(integer_number)
    @integer_number = integer_number
  end

  def to_roman
    thousands = integer_number / 1000
    hundreds = (integer_number % 1000) / 100
    tens = (integer_number % 100) / 10
    ones = (integer_number % 10)

    thousands_roman = build_single_roman(thousands, 'thousands')
    hundreds_roman = build_single_roman(hundreds, 'hundreds')
    tens_roman = build_single_roman(tens, 'tens')
    ones_roman = build_single_roman(ones, 'ones')

    final_roman = thousands_roman + hundreds_roman + tens_roman + ones_roman

  end

  def build_single_roman(value, tens_place)
    if value == 0
      return ''
    else
      start, middle, ending = LETTERS_DICT[tens_place]

      romans_array = [start, start*2, start*3, start + middle,
                      middle, middle + start, middle + (start*2), middle + (start*3),
                      start + ending ]

      roman_dict = Hash[DIGITS_ARRAY.zip(romans_array)]

      return(roman_dict[value])
    end
  end

end

# binding.pry




=begin

Roman Numerals Rules

Letters for 1s: I, V, X
Letters for 10s: X, L, C
Letters for 100s: C, D, M
Letters for 1000s: M

so, our tactic will be to break down the integer by tens place. we can do that by
  using div and the mod operator


def build_roman(tens_place)
  if tens+place



1 = I
2 = II
3 = III
4 = IV
5 = V
6 = VI
7 = VII
8 = VIII
9 = IX

10 = X
11 = XI
12 = XII
13 = XIII
14 = XIV
15 = XV
16 = XVI
17 = XVII
18 = XVIII
19 = XIX

10 = X
20 = XX
30 = XXX
40 = XL
50 = L
60 = LX
70 = LXX
80 = LXXX
90 = XC

100 = C
200 = CC
300 = CCC
400 = CD
500 = D
600 = DC
700 = DCC
800 = DCCC
900 = CM

1000 = M
2000 = MM
3000 = MMM
=end
