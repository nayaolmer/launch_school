class Player
  attr_accessor :move, :score, :name

  def initialize
    @score = 0
    @name = set_name
  end
end

class Human < Player
  def set_name
    puts "Please enter your name:"
    gets.chomp.to_s
  end

  def choose
    puts "Please select one of three options: Rock, Paper, or Scissors"
    choice = gets.chomp.to_s
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    "Computer"
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = ['Rock', 'Paper', 'Scissors']

  attr_accessor :value

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'Rock'
  end

  def paper?
    @value == 'Paper'
  end

  def scissors?
    @value == 'Scissors'
  end

  def to_s
    value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
end

class RpsGame
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new(:human)
    @computer = Computer.new(:computer)
    @winner = ''
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, #{human.name}!"
  end

  def display_winner
    if human.move.value == computer.move.value
      self.winner = 'Tied'
    elsif human.move.>(computer.move)
      self.winner = human.name
      human.score += 1
    elsif human.move.<(computer.move)
      self.winner = 'Computer'
      computer.score += 1
    end
    puts "The winner is: #{winner}"
  end

  def play_again?
    puts "Do you want to play again? y/n"
    gets.chomp.to_s
  end

  def display_goodbye_message
    puts "Goodbye!"
  end

  def display_score
    puts "#{human.name}: #{human.score}"
    puts "Computer: #{computer.score}"
  end

  def play
    display_welcome_message
    loop do
      puts "The current score is: "
      display_score
      human.choose
      puts "Human chose #{human.move}"
      computer.choose
      puts "Computer chose #{computer.move.value}"
      display_winner
      break if !play_again?.include? 'y'
    end
    puts "The final score is: "
    display_score
    display_goodbye_message
  end
end

game1 = RpsGame.new
game1.play
