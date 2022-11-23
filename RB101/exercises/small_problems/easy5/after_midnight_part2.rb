=begin
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

=end

MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 24 * MINUTES_PER_HOUR

def after_midnight(user_input)
  hours, minutes = user_input.split(":").map { |n| n.to_i }
  hours = hours % 24
  total_mins = hours*MINUTES_PER_HOUR + minutes
  total_mins
end

def before_midnight(user_input)
  hours, minutes = user_input.split(":").map { |n| n.to_i }
  hours = hours % 24
  total_mins = hours*MINUTES_PER_HOUR + minutes
  if total_mins == 0
    return_mins = 0
  else
    return_mins = MINUTES_PER_DAY - total_mins
  end
  return_mins
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0