# Build a program that asks a user for the length and width of a room
# in meters and then displays the area of the room in both square meters
# and square feet.
# Note: 1 square meter == 10.7639 square feet

SQUARE_FEET_IN_METER = 10.7639

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Welcome to How Big Is My Room!")
loop do
  prompt("Please enter the length of your room in meters:")
  length_m = gets.chomp.to_i
  prompt("Please enter the width of your room in meters:")
  width_m = gets.chomp.to_i
  square_meters = length_m * width_m
  square_feet = (square_meters * SQUARE_FEET_IN_METER).round(2)
  prompt("The area of your room is #{square_meters} square meters " + \
          "and #{square_feet} square feet")
  prompt("Would you like to calculate a new area? (Y/N)")
  continue = gets.chomp.to_s
  break if !continue.downcase.start_with?('y')
end
prompt("Goodbye!")
