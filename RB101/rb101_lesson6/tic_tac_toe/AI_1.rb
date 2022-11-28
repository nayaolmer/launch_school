
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def initialize_board
  new_board = Hash.new
  (1..9).each { |n| new_board[n] = INITIAL_MARKER }
  new_board
end

def empty_squares(board_input)
  board_input.keys.select { |n| board_input[n] == INITIAL_MARKER }
end

def computer_places_piece!(brd)
  location = empty_squares(brd).sample
  square_to_defend = computer_ai_defense(brd)
  if square_to_defend == 0
    brd[location] = COMPUTER_MARKER
  else
    brd[square_to_defend] = COMPUTER_MARKER
  end
end

def computer_ai_defense(brd)
  winning_locations = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                       [1, 4, 7], [2, 5, 8], [3, 6, 9],
                       [1, 5, 8], [3, 5, 7]]

  ai_check = {}
  winning_locations.each_with_index do |loc, idx|
    blank_positions = brd.select { |k, _| loc.include?(k)}.count { |_, v| v == INITIAL_MARKER}
    player_positions = brd.select { |k, _| loc.include?(k)}.count { |_, v| v == PLAYER_MARKER}
    ai_check[idx] = player_positions == 2 && blank_positions == 1
  end

  ai_check.select! do |k, v|
    v == true
  end
  square_to_select = 0
  winning_locations[ai_check.keys[0]].each do |n|
    square_to_select = n if brd[n] == INITIAL_MARKER
  end 
  square_to_select
end
## Need to make it defensive, so that the computer blocks the third square when there are two in a row.

def find_at_risk_square(line, brd)
  if brd.values_at(*line).count('X') == 2
    brd.select { |k,v| line.include?(k) && v == ' ' }.keys.first
  else
    nil
  end
end


board = initialize_board

board[1] = PLAYER_MARKER
board[4] = PLAYER_MARKER


binding.pry