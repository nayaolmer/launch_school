=begin
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Welcome to When Will I Retire!")

loop do
  prompt("What is your age?")
  age = gets.chomp.to_i
  prompt("At what age would you like to retire?")
  retirement_age = gets.chomp.to_i
  age_diff = retirement_age - age
  current_year = Time.now.year
  retirement_year = 2022 + age_diff
  prompt("It's #{current_year}. You will retire in #{retirement_year}.\n" + \
          "You only have #{age_diff} years of work to go!")
  prompt("Calculate again? y/n")
  again = gets.chomp.to_s
  break if !again.downcase.start_with?('y')
end

prompt("Goodbye!")
