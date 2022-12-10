=begin
### Problem
>> Write a method to determine the number of Friday the 13ths in a given year
Input: Year
Output: Count of Friday the 13ths

Assumptions:
>> Input will always be after 1752, you can use the standard gregorian calendar

### Examples
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

### Algo
(1) Take in a year
(2) Iterate through every month of that year
(3) For each Month, lookup the day of week for the 13th
>> If the day of week for the 13th == Friday, += 1 to the count
(4) Return the count
=end

require 'Date'

def friday_13th(year)
  months = (1..12).to_a
  count = 0
  months.each do |month|
    if Date.parse("#{year}-#{month}-13").wday == 5
      count += 1
    end
  end
  count
end

def count_mon_5_fri(year)
  months = (1..12).to_a
  months_ct = 0
  months.each do |month|
    days_count = Date.new(year, month, -1).day
    days = (1..days_count).to_a
    friday_count = 0
    days.each do |day|
      friday_count += 1 if Date.new(year, month, day).wday == 5
    end
    months_ct += 1 if friday_count == 5
  end
  months_ct
end








puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

puts count_mon_5_fri(2022)
puts count_mon_5_fri(2021)
puts count_mon_5_fri(2020)
