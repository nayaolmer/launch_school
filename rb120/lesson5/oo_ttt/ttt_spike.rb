=begin


(1) Write a description of the problem and extract major nouns and verbs.

We will be building a computer version of tic tac toe, where the computer operator
(the player) will be playing against the computer.
The game is played on a board that is sectioned into a 3x3 grid. The object of the game
is to place your pieces such that three of your pieces connect, either in a row
horizontally, vertically, or diagonally.

Each player takes a turn placing their pieces on the board. Eventually, one of the
players wins, or the board is filled with pieces and no one wins.

Major Nouns: board, player, computer player
Major Verbs: place a piece/play a turn, win

(2) Make an initial guess at organizing the verbs into nouns and do a spike to explore the problem with temporary code.

=end


require "pry"

class Player
  attr_accessor :name, :marker

  def initialize(player_name, player_marker)
    @name = player_name
    @marker = player_marker
  end

end

class Human < Player
  def initialize
    puts "Please enter your name:"
    name = gets.chomp.to_s
    puts "Please choose your marker: X or O"
    marker = ''
    loop do
      marker = gets.chomp.to_s
      break if ["X","O"].include? marker
      puts "Invalid selection. Please choose X or O."
    end
    super(name, marker)
  end

  def select_square(available_squares)
    puts "Please enter the square you would like to mark:"
    puts "Available squares are: #{available_squares}"
    square = ''
    loop do
      square = gets.chomp.to_i
      break if available_squares.include? square
      puts "Invalid selection. Please only select an available square: #{available_squares}"
    end
    square
  end

end

class Computer < Player

  def select_square(available_squares)
    puts "Computer makes a move"
    available_squares.sample
  end

end

class Board
  attr_accessor :squares, :available_squares
  def initialize
    @squares = [" "]*9
    @available_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def return_available_squares
    available_squares = []
    squares.each_with_index {|square, idx| available_squares << idx + 1 if square == ''}
    available_squares
  end

  def mark_square(square_location, marker)
    self.squares[(square_location - 1)] = marker
    available_squares.delete(square_location)
  end

  def check_winner?
    winning_sets = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
    winning_sets.any? do |winning_set|
      winning_set.all? { |square| squares[square] == "X" } || winning_set.all? { |square| squares[square] == "O" }
    end
  end

  def clear_board
    puts "now clearing the screen"
    system "clear"
  end

  def display
    clear_board
    puts "Current state of board:"
    puts '-------------'
    puts "| #{board.squares[0]} | #{board.squares[1]} | #{board.squares[2]} |"
    puts '-------------'
    puts "| #{board.squares[3]} | #{board.squares[4]} | #{board.squares[5]} |"
    puts '-------------'
    puts "| #{board.squares[6]} | #{board.squares[7]} | #{board.squares[8]} |"
    puts '-------------'
  end

end

class TTTGame
  attr_accessor :human_player, :computer_player, :board, :first_player, :second_player, :winner

  def initialize
    @human_player = Human.new
    @computer_player = Computer.new("Computer", pick_opposite_marker(human_player.marker))
    @board = ''
    @first_player = ''
    @second_player = ''
    @winner = ''
  end

  def pick_opposite_marker(human_marker)
    markers = ['X', 'O']
    markers.delete(human_marker)
    markers[0]
  end

  def welcome_message
    puts "Welcome to tic, tac, toe!"
  end

  def clear_the_game
    puts "now clearing the screen"
    system "clear"
  end

  def set_player_sequence(player1, player2)
    players = [player1, player2]
    self.first_player = [player1, player2].sample
    players.delete(first_player)
    self.second_player = players[0]
  end



  def play_again?
    puts "Play again? Y/N"
    gets.chomp.to_s
  end



  def play
    welcome_message
    loop do
      self.board = Board.new
      set_player_sequence(human_player, computer_player)
      puts "#{first_player.name} goes first."
      board.display
      # clear_the_game
      loop do
        board.mark_square(first_player.select_square(board.available_squares), first_player.marker)
        board.display
        if board.available_squares.length == 0
          winner = 'tied'
          break
        elsif board.check_winner?
          winner = first_player
          break
        end
        board.mark_square(second_player.select_square(board.available_squares), second_player.marker)
        board.display
        if board.available_squares.length == 0
          winner = 'tied'
          break
        elsif board.check_winner?
          winner = second_player
          break
        end
      end
      puts "Game over! Winner is: #{winner}"
      board.display

      break if !play_again.include? 'y'
    end
  #     loop do
  #       display_board
  #       player_1_move
  #       player_2_move
  #       break if determine_winner
  #     end
  #     display board
  #     winner_message
  #     play_again
  #     break if play_again == 'n'
  #   end
  #   goodbye_message
  # end
  end
end

game1 = TTTGame.new
game1.play


# binding.pry