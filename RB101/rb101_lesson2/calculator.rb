# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

require 'numeric'

puts "This calculator will perform addition, subtraction, multiplication, or division for two numbers."

puts "Please enter the first number:"
first_number = Kernel.gets().chomp()

until first_number.numeric?
  puts "Please enter a number:"
  first_number = Kernel.gets().chomp()
end

first_number = first_number.to_f

puts "Please enter the second number:"
second_number = Kernel.gets().chomp()

until second_number.numeric?
  puts "Please enter a number:"
  second_number = Kernel.gets().chomp()
end

second_number = second_number.to_f

puts "Please select which action you would like to perform. 
      Type \"a\" for addition, \"s\" for subtraction,
      \"m\" for multiplication, and \"d\" for division."

action_selection = Kernel.gets().chomp()

until ["a", "s", "m", "d"].include?(action_selection.to_s)
  puts "Please select a valid action. Type \"a\" for addition, \"s\" for subtraction,
  \"m\" for multiplication, and \"d\" for division."
  action_selection = Kernel.gets().chomp()
end

action_selection = action_selection.to_s

puts first_number
puts second_number

case action_selection
when "a" then
  puts "Addition selected."
  sum = first_number + second_number
  puts "The sum of #{first_number} and #{second_number} is #{sum}."
when "s" then
  puts "Subtraction selected."
  difference = first_number - second_number
  puts "The difference of #{first_number} and #{second_number} is #{difference}."
when "m" then
  puts "Multiplication selected."
  product = first_number * second_number
  puts "The product of #{first_number} and #{second_number} is #{product}"
when "d" then
  puts "Division selected."
  until second_number != 0 && second_number.numeric?
    puts "Please replace the second number with a non-zero number."
    second_number = Kernel.gets().chomp()
  end
  second_number = second_number.to_f
  division = first_number / second_number
  puts "The division of #{first_number} and #{second_number} is #{division}."
end

puts "The end!"




