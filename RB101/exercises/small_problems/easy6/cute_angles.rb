=begin
Write a method that takes a floating point number that represents an
angle between 0 and 360 degrees and returns a String that represents that
angle in degrees, minutes and seconds. You should use a degree symbol (°)
to represent degrees, a single quote (') to represent minutes,
and a double quote (") to represent seconds. A degree has 60 minutes,
while a minute has 60 seconds.

You should use two digit numbers with leading zeros when formatting the minutes and
seconds, e.g., 321°03'07".

=end


=begin
### Thinking
(1) Separate out degree by taking input_angle.floor
(2) Extract minutes/seconds by doing input_angle - input_angle.floor
(3) Multiply by 60 to get minutes
Then take seconds % 60 to get seconds
then take seconds/60 % 60 to get minutes
then take seconds/60/60 to get degrees, which should just equal the original decimal degrees
=end


DEGREES_TO_MINUTES = 60 # 1 degree = 60 minutes
MINUTES_TO_SECONDS = 60 # 1 minute = 60 seconds

DEGREE = "\xC2\xB0"



def dms(angle)
  deg = angle.floor
  min_dec = (angle - deg) * 60
  min = min_dec.floor

  sec_dec = (min_dec - min) * 60
  sec = sec_dec.floor
  if deg > 360
    until deg < 360
      deg -= 360
    end
  elsif deg < 0
    until deg > 0
      deg += 360
    end
  end
  puts format(%(#{deg}#{DEGREE}%02d'%02d"), min, sec)
  return format(%(#{deg}#{DEGREE}%02d'%02d"), min, sec)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")