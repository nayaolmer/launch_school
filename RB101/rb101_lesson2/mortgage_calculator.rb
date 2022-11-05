require 'numeric'

loop do
  ## Inputs
  puts "Welcome to the mortgage calculator! To begin, we will need your loan amount, anual percentage rate, and the loan duration."

  #### loan amount
  puts "Please enter your loan amount:"
  loan_amount = gets.chomp
  until loan_amount.numeric?
    puts "Please enter a numeric value for your loan amount:"
    loan_amount = gets.chomp
  end
  loan_amount = loan_amount.to_f

  #### APR
  puts "Please enter your annuual percentage rate:"
  apr = gets.chomp
  until apr.numeric?
    puts "Please enter a numeric value for your apr:"
  end
  apr = (apr.to_f) / 100 ## convert to %

  #### Loan duration in years
  puts "Please enter your loan duration in years:"
  loan_duration_years = gets.chomp
  until loan_duration_years.numeric?
    puts "Please enter a numeric value for your loan duration:"
    loan_duration_years = gets.chomp
  end
  loan_duration_years = loan_duration_years.to_f

  ## Now calculate the mortgage

  loan_duration_months = loan_duration_years * 12
  monthly_interest_rate = apr / 12

  monthly_payment = loan_amount *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

  puts "Your monthly payment is $#{format('%.2f', monthly_payment)}"

  puts "Would you like to complete another calculation? Y/N:"

  reloop = gets.chomp

  until ['y', 'n'].include? reloop.to_s.downcase
    puts "Please enter Y or N."
    reloop = gets.chomp
  end
  break unless reloop.to_s.downcase.start_with? 'y'
end

puts "Thank you for using the Mortgage Calculator!"
puts "Goodbye!"
