require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

markers_hash = { initial_marker: ' ', player_marker: 'X', computer_marker: 'O'}

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

def place_piece!(brd, input_player)
  if input_player == 'Player'
    player_places_piece!(brd)
  elsif input_player == 'Computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(input_player)
  if input_player == 'Player'
    'Computer'
  elsif input_player == 'Computer'
    'Player'
  end
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
  display_board(brd)
end

def find_at_risk_square(brd, line, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == ' ' }.keys.first
  else
    nil
  end
end 

def find_offense_square(brd, line, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == ' ' }.keys.first
  else
    nil
  end
end 

def computer_places_piece!(brd)
  location = empty_squares(brd).sample
  defense_square = nil
  offense_square = nil
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
  winning_lines.each do |subarray| 
    defense_square = find_at_risk_square(brd, subarray, PLAYER_MARKER)
    break if defense_square
  end
  winning_lines.each do |subarray|
    offense_square = find_offense_square(brd, subarray, COMPUTER_MARKER)
    break if offense_square
  end

  if offense_square
    brd[offense_square] = COMPUTER_MARKER
    prompt("Computer selected square #{offense_square}")
  elsif defense_square
    brd[defense_square] = COMPUTER_MARKER
    prompt("Computer selected square #{defense_square}")
  elsif brd[5] == ' '
    brd[5] = COMPUTER_MARKER
    prompt("Computer selected square 5")
  else
    brd[location] = COMPUTER_MARKER
    prompt("Computer selected square #{location}")

  end
  
  display_board(brd)
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
# binding.pry

loop do 
  player_score = 0
  computer_score = 0
  prompt("Welcome to Tic Tac Toe!")
  loop do
    prompt("Current score:")
    prompt("Player: #{player_score}")
    prompt("Computer: #{computer_score}")

    ## User decides first mover
    # prompt("Who would you like to start? Computer or Player?")
    # start_user = gets.chomp.to_s 
    # until ['Computer', 'Player'].include?(start_user)
    #   prompt('Invalid entry. Please enter either Computer or Player.')
    #   start_user - gets.chomp.to_s
    # end

    ## Computer decides first mover 
    playing_user = ['Computer','Player'].sample 
    prompt("#{playing_user} will begin the game.")

    game_board = initialize_board
    display_board(game_board) if playing_user == "Player"
    loop do

      place_piece!(game_board, playing_user)
      playing_user = alternate_player(playing_user)
      # prompt("Current player is #{playing_user}")
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
