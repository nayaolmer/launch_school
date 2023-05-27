=begin Rock Paper Scissors with OOP

(1) Write a textual description of the problem or exercise

Rock, paper, scissors is a game for two players. Each player shows their hand at
the count of three. When they show their hand, they can choose one of three options:
rock, paper, or scissors. Rock beats scissors, paper beats rock, and scissors beats paper

The game flow is:
Player makes a choice
Computer makes a choice
Winner is displayed

(2) Extract the major nouns and verbs from the description

verbs: choose hand, display winner
nouns: player, computer, rock, paper, scissors, game

(3) Organize and associate the verbs with the nouns

=end

class RpsGame
  attr_accessor :winner

  def initialize
    @winner = ''
    @players = []
  end

  def add_player(new_player)
    self.players << new_player
  end

  def display_winner(player, computer)
    if player.choice == computer.choice
      self.winner = 'tied'
    elsif (player.choice == 'Rock' && computer.choice == 'Scissors') ||
            (player.choice == 'Scissors' && computer.choice == 'Paper' ) ||
              (player.choice == 'Paper' && computer.choice == 'Rock')
      self.winner = player.name
    else
      self.winner = computer.name
    end
    puts "The winner is: #{winner}"
  end

  class Player
    attr_accessor :choice, :name

    CHOICES = ['Rock', 'Paper', 'Scissors']
    def initialize(name)
      @name = name
      @choice = ''
    end

    def choose
      self.choice = CHOICES.sample
      puts "#{name} chose #{choice}."
    end
  end

end




game1 = RpsGame.new
player1 = RpsGame::Player.new('Player')
computer = RpsGame::Player.new('Computer')

player1.choose
computer.choose

game1.display_winner(player1, computer)

