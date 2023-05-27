


def divisors(some_int)
  possible_divisors = (1..some_int).to_a
  divisors = []
  possible_divisors.each do |num|
    divisors << num if some_int % num == 0
  end
  # p divisors
  divisors
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute