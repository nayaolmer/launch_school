=begin
Write a program that will ask for user's name.
The program will then greet the user.
If the user writes "name!" then the computer yells back to the user.
=end

def prompt(msg)
  puts("=> #{msg}")
end

prompt("Welcome to Greeting A User!")

loop do
  prompt("What is your name?")
  name = gets.chomp.to_s
  greeting = "Hello #{name.delete("!")}."
  if name[-1] == "!"
    prompt("#{greeting.upcase} WHY ARE WE SCREAMING?")
  else
    prompt(greeting)
  end
  prompt("Go again? Y/N")
  go_again = gets.chomp.to_s
  break if !go_again.downcase.start_with? "y"
end

prompt("Goodbye!")



