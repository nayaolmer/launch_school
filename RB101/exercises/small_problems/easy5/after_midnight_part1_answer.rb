
MINUTES_PER_DAY = 1440
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60

# def time_of_day(mins_input)
#   new_min = MINUTES_PER_DAY + mins_input
#   hours = new_min/60

#   if hours.abs > 23
#     hours = hours % 24
#   end

#   if hours.to_s.length < 2
#     hours_str = "0#{hours.to_s}"
#   else
#     hours_str = hours.to_s
#   end

#   minutes = new_min % 60

#   if minutes.to_s.length < 2
#     minutes_str = "0#{minutes.to_s}"
#   else
#     minutes_str = minutes.to_s
#   end

#   output = "#{hours_str}:#{minutes_str}"
#   puts output
#   output
# end


def reduce_to_single_day_min(mins_input1)
  while mins_input1 < 0
    mins_input1 += MINUTES_PER_DAY
  end

  mins_input1 % MINUTES_PER_DAY
end




def time_of_day(mins_input2)
  minutes = reduce_to_single_day_min(mins_input2)

  hours, mins = minutes.divmod(MINUTES_PER_HOUR)
  format("%02d:%02d", hours, mins)
end



puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

#### Further exploration

## Normalize using % in one line