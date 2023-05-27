

=begin

Requirements:
(1) Perfect numbers: Aliquot sum = number
(2) Abundant numbers: Aliquot sum > number
(3) Deficient numbers: Aliquot sum < number

Aliquot sum:
(1) Find all divisors of a number (include 1, do not include the number)
(2) Sum the divisors



Examples:
15
>> Divisors = 1, 3, 5
>> Aliquot sum = 1 + 3 + 5 = 9
>> Type: Deficient

6
>> Divisors = 1, 2, 3
>> Aliquot sum = 1 + 2 + 3 = 6
>> Type: Perfect

24
>> Divisors: 1, 2, 3, 4, 6, 8, 12
>> Aliquot sum = 36
>> Type: Abundant

Class: Number
Methods:
(1) get_divisors
(2) get aliquot sum
(3) determine type

(1) get_divisors(number)
divisors = []
1.upto(number). do |num|
  divisors << num if number % num == 0
end


(2) get aliquot sum
sum divisors


=end


class PerfectNumber

  def self.classify(number)
    raise StandardError if number < 1
    divisors = []
    1.upto(number - 1) do |num|
      divisors << num if number % num == 0
    end
    aliquot_sum = divisors.sum

    if aliquot_sum == number
      type = 'perfect'
    elsif aliquot_sum > number
      type = 'abundant'
    elsif aliquot_sum < number
      type = 'deficient'
    end
    type
  end

end






