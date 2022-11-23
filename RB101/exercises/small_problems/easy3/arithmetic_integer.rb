=begin
Write a program that prompts the user for two positive integers,
and then prints the results of the following operations on those
two numbers: addition, subtraction, product, quotient, remainder, and power.
Do not worry about validating the input.
=end

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Welcome to Arithmetic Integer!")

loop do
  prompt("Please enter the first positive integer:")
  number1 = gets.chomp.to_i
  prompt("Please enter the second positive integer:")
  number2 = gets.chomp.to_i

  prompt("#{number1} + #{number2} = #{number1 + number2}")
  prompt("#{number1} - #{number2} = #{number1 - number2}")
  prompt("#{number1} * #{number2} = #{number1 * number2}")
  prompt("#{number1} / #{number2} = #{number1 / number2}")
  prompt("#{number1} % #{number2} = #{number1 % number2}")
  prompt("#{number1}**#{number2} = #{number1**number2}")

  prompt("Would you like to go again? Y/N")
  go_again = gets.chomp.to_s
  break if !go_again.downcase.start_with? "y"
end
