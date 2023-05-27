=begin
We're creating a guessing game. The computer picks a number between 1 and 100
(inclusive) at random. The user then has 7 tries to guess the correct number.
Each time the user guesses, the game tells the user whether the guess was too low
or too high
=end

# require Math

class GuessingGame
  attr_accessor :upper_range, :lower_range, :number, :guesses_remaining, :current_guess

  def initialize
    @upper_range = nil
    @lower_range = nil
    @number = nil
    @guesses_remaining = nil
    @current_guess = nil
  end

  def prompt_for_range
    puts "Enter your range for the guessing game."
  end

  def set_upper_range
    puts "Enter the higher number: "
    higher_number = gets.chomp.to_i
    self.upper_range = higher_number
  end

  def set_lower_range
    puts 'Enter the lower number:'
    lower_number = gets.chomp.to_i
    self.lower_range = lower_number
  end

  def set_secret_number
    self.number = (lower_range..upper_range).to_a.sample
  end

  def set_total_guesses
    self.guesses_remaining = Math.log2(upper_range + 1).ceil
  end

  def display_guess_count_remaining
    puts "You have #{guesses_remaining} guesses remaining."
  end

  def get_user_guess
    puts "Enter a number between #{lower_range} and #{upper_range}:"
    user_guess = gets.chomp.to_i
    until (lower_range..upper_range).include? user_guess
      puts "Invalid guess. Please enter a number between #{lower_range} and #{upper_range}:"
      user_guess = gets.chomp.to_i
    end
    self.current_guess = user_guess
    self.guesses_remaining -= 1
    puts "User guessed: #{current_guess}"

  end

  def evaluate_guess
    if current_guess > number
      puts "Your guess is too high."
    elsif current_guess < number
      puts "Your guess is too low."
    elsif current_guess == number
      puts "That's the number!"
    else
      puts "Something went wrong"
    end
  end

  def end_game
    if current_guess == number
      # puts "That's the number!"
      puts "You won!"
    else
      puts "The number was: #{number}"
      puts "You have no more guesses. You lost!"
    end
  end

  def play
    prompt_for_range
    set_upper_range
    set_lower_range
    set_secret_number
    set_total_guesses
    until (current_guess == number) || (guesses_remaining == 0)
      display_guess_count_remaining
      get_user_guess
      evaluate_guess
    end
    end_game
  end
end

loop do
  game = GuessingGame.new
  game.play
  puts "Would you like to play again? y/n"
  play_again = gets.chomp.to_s
  break if !play_again.include?('y')
end










