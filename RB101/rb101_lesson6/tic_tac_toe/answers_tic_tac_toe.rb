require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array_input, delimiter=', ', lastword='or')
  "#{array_input[0...-1].join(', ')}, #{lastword} #{array_input[-1]}"
end

def initialize_board
  new_board = Hash.new
  (1..9).each { |n| new_board[n] = INITIAL_MARKER }
  new_board
end

def display_board(board_input)
  puts "|-----------|"
  puts "| #{board_input[1]} | #{board_input[2]} | #{board_input[3]} |"
  puts "|---+---+---|"
  puts "| #{board_input[4]} | #{board_input[5]} | #{board_input[6]} |"
  puts "|---+---+---|"
  puts "| #{board_input[7]} | #{board_input[8]} | #{board_input[9]} |"
  puts "|-----------|"
end

def empty_squares(board_input)
  board_input.keys.select { |n| board_input[n] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  location = ''
  loop do
    prompt("Select a valid location to place your piece: #{joinor(empty_squares(brd))}")
    location = gets.chomp.to_i
    break if empty_squares(brd).include?(location)
    prompt("Invalid selection, please try again.")
  end
  brd[location] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  location = empty_squares(brd).sample
  brd[location] = COMPUTER_MARKER
end

def win?(piece, board)
  win = false
  ## Row wins
  win = true if board[1] == piece && board[2] == piece && board[3] == piece
  win = true if board[4] == piece && board[5] == piece && board[6] == piece
  win = true if board[7] == piece && board[8] == piece && board[9] == piece
  ## Column wins
  win = true if board[1] == piece && board[4] == piece && board[7] == piece
  win = true if board[2] == piece && board[5] == piece && board[8] == piece
  win = true if board[3] == piece && board[6] == piece && board[9] == piece
  ## Diagnoal wins
  win = true if board[1] == piece && board[5] == piece && board[9] == piece
  win = true if board[7] == piece && board[5] == piece && board[3] == piece
  win
end

### Initialize a blank board


loop do 
  player_score = 0
  computer_score = 0
  prompt("Welcome to Tic Tac Toe!")
  loop do
    prompt("Current score:")
    prompt("Player: #{player_score}")
    prompt("Computer: #{computer_score}")
    game_board = initialize_board
    display_board(game_board)
    loop do
      player_places_piece!(game_board)
      computer_places_piece!(game_board)
      display_board(game_board)
      ## Break if a win
      if win?(COMPUTER_MARKER, game_board)
        prompt("Computer won this round!")
        computer_score += 1
        break
      elsif win?(PLAYER_MARKER, game_board)
        prompt("Player won this round!")
        player_score += 1
        break
      elsif empty_squares(game_board).empty?
        prompt("It was a tie.")
        break
      end
    end
    if [player_score, computer_score].max == 5
      prompt("Player won!") if player_score == 5
      prompt("Computer won!") if computer_score == 5
      break
    end
  end
  prompt('Play again? Y/N')
    play_again = gets.chomp.to_s
    break if !play_again.downcase.start_with?('y')
end

prompt('Goodbye!')
