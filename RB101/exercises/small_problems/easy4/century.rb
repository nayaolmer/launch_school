=begin
Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century number,
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01.
So, the years 1901-2000 comprise the 20th century.

=end


=begin
##### Flow

=end



=begin

##### Thinking ...

1st century: 1 .. 100
2nd century: 101 .. 200
3rd century:


=end


def century(year)
  cent = year.ceil(-2) / 100
  descriptor = nil
  if [11, 12, 13].include? cent.to_s[-2..-1].to_i
    descriptor = 'th'
  elsif cent.to_s[-1].to_i == 1
    descriptor = 'st'
  elsif cent.to_s[-1].to_i == 2
    descriptor = 'nd'
  elsif cent.to_s[-1].to_i == 3
    descriptor = 'rd'
  else
    descriptor = 'th'
  end

  cent_output = "#{cent}#{descriptor}"

end



## Examples

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'




