require 'pry'

VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('You lost!')
  elsif computer == player
    prompt('You tied!')
  end
end

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Please enter a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("Your choice: #{choice}, computer choice: #{computer_choice}")

  ## conditional for user to win
  display_results(choice, computer_choice)

  prompt("Play again? (Y/N)")
  play_again = gets.chomp.to_s
  break unless play_again.downcase.start_with? 'y'
end

prompt("Thanks for playing, goodbye!")
