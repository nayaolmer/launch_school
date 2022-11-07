require 'pry'

VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'Spock']

valid_choices_hash = { 'rock': 'r', 'paper': 'p', 'scissors': 's',
                       'lizard': 'l', 'Spock': 'Sp' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'Spock') ||
    (first == 'Spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'Spock') ||
    (first == 'Spock' && second == 'rock') ||
    (first == 'rock' && second == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('You lost!')
  elsif computer == player
    prompt('You tied!')
  else
    prompt('Something went wrong!')
  end
end

## Initialize game
loop do
  prompt("Welcome to rock, paper, scissors, lizard, Spock!")
  set = 1
  game = 1
  player_score = 0
  computer_score = 0

  ## Begin first set
  loop do
    prompt('----------------------------------------')
    prompt("Starting set #{set}, game #{game}")
    prompt('----------------------------------------')

    ## Validate entry
    abb_choice = ''
    loop do
      prompt("Choose one:")
      valid_choices_hash.each { |k, v| puts "For #{k} enter #{v}" }
      abb_choice = gets.chomp.to_s

      if valid_choices_hash.values.include?(abb_choice)
        break
      else
        prompt("Please enter a valid choice.")
      end
    end

    choice = valid_choices_hash.key(abb_choice).to_s

    computer_choice = VALID_CHOICES.sample

    prompt("Your choice: #{choice}, computer choice: #{computer_choice}")

    display_results(choice, computer_choice)
    # binding.pry

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    game += 1 unless choice == computer_choice

    prompt("Current score: user: #{player_score}, computer: #{computer_score}")

    break if [player_score, computer_score].max == 3
  end

  prompt('User is the grand winner!') if player_score > computer_score
  prompt('Computer is the grand winner!') if player_score < computer_score
  prompt('Play again? Enter Y/N')
  play_again = gets.chomp.to_s
  break if play_again.downcase.start_with? 'n'
end

prompt('Thanks for playing, goodbye!')
