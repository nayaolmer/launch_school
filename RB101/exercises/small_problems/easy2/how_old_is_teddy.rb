# Build a program that randomly generates and prints Teddy's age.
# To get the age, you should generate a random number between 20 and 200.

def get_teddys_age
  (20..200).to_a.sample
end

def prompt(msg)
  puts "=> #{msg}"
end


loop do
  prompt("Would you like to enter a name? Y/N")
  name_branch = gets.chomp.to_s
  if name_branch.downcase.start_with?('y')
    prompt("Enter a name:")
    name = gets.chomp.to_s
    prompt("#{name} is #{get_teddys_age} years old!")
  else
    prompt("Teddy is #{get_teddys_age} years old!")
  end
  prompt("Repeat? Y/N")
  answer = gets.chomp.to_s
  break if !answer.downcase.start_with?('y')
end

prompt("Goodbye!")
