=begin
The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and
returns the time of day in 24 hour format (hh:mm).
Your method should work with any integer input.

=end

def time_of_day(minutes_input)
  midnight_ref = Time.mktime(2022, 11, 20, 0, 0)
  new_time = midnight_ref + minutes_input * 60
  output = new_time.strftime("%A %H:%M")
  output
end


puts time_of_day(0) # == "00:00"
puts time_of_day(-3) # == "23:57"
puts time_of_day(35) # == "00:35"
puts time_of_day(-1437) # == "00:03"
puts time_of_day(3000) # == "02:00"
puts time_of_day(800) # == "13:20"
puts time_of_day(-4231) # == "01:29"


