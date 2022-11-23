=begin
Write a program that asks the user to enter an integer greater than 0,
then asks if the user wants to determine the sum or product of
all numbers between 1 and the entered integer.
=end

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Welcome!")
loop do
  prompt("Enter a number greater than 0.")
  num = gets.chomp.to_i
  prompt("Would you like to sum or multiply? S/M")
  action = gets.chomp.to_s
  arr = (1..num).to_a
  if action == 'S'
    sum = arr.inject { |total, n| sum + n }
    prompt("The sum is #{sum}.")
  elsif action == 'M'
    prod = arr.inject { |total, n| total * n }
    prompt("The product is #{prod}.")
  else
    prompt("Invalid entry. Please retry.")
  end
  prompt("Try again? Y/N")
  go_again = gets.chomp.to_s
  break if !go_again.downcase.start_with? "y"
end

prompt("Goodbye!")
