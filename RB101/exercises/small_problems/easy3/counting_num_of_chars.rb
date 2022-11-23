=begin
Write a program that will ask a user for an input of a word
or multiple words and give back the number of characters.
Spaces should not be counted as a character.
=end

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Welcome to Count My Characters!")

loop do
  prompt("Please enter your input.")
  words = gets.chomp.to_s
  char_count = words.delete(' ').chars.length
  prompt("There are #{char_count} characters in \"#{words}\".")
  prompt("Would you like to go again? Y/N")
  go_again = gets.chomp.to_s
  break if !go_again.downcase.start_with? "y"
end

prompt("Goodbye!")
