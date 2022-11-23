# Tip calculator
=begin
Create a simple tip calculator. The program should prompt for a bill amount
and a tip rate. The program must compute the tip and then display both the
tip and the total amount of the bill.
=end

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Welcome to tip calculator!")

loop do
  prompt("Please enter the amount of your bill:")
  bill_amt = gets.chomp.to_f
  prompt("Please enter the percentage you'd like to tip:")
  tip_percent = gets.chomp.to_f
  tip_amount = (bill_amt * tip_percent / 100).round(2)
  total_bill = bill_amt + tip_amount
  prompt("Tip is: $#{tip_amount}")
  prompt("Total bill is: $#{total_bill}")
  prompt("Calculate another tip? Y/N")
  continue_input = gets.chomp.to_s
  break if !continue_input.downcase.start_with?('y')
end

prompt("Goodbye!")
