### Try to re-write algorithm 

=begin 
** Find At-Risk Square **
(1) Create list of rows/cols/diags, known as *lines* that can result in a win
(2) Use this list to loop through the board and find lines where there are two "Xs"
(3) Once we've identified where the line is with an at-risk square, identify which square in the line is at risk
>> We accomplish this by looping through the board, but only selecting the square whose location belongs in the line AND the value is " "
(4) Return the square location
=end

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'


winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 8], [3, 5, 7]]

def initialize_board
  new_board = Hash.new
  (1..9).each { |n| new_board[n] = INITIAL_MARKER }
  new_board
end

board = initialize_board

board[1] = PLAYER_MARKER
board[4] = PLAYER_MARKER

binding.pry

def find_at_risk_square(line, marker)
  if board.values_at(line).count(marker)
    board.select { |k, v| test_line.include?(k) && v == ' ' }.keys.first
  else
    nil
  end
end 

def computer_places_piece!(brd)
  location = empty_squares(brd).sample
  square = nil
  winning_lines.each do |subarray| 
    square = find_at_risk_square(subarray, PLAYER_MARKER)
    break if square
  end
  if !square
    brd[location] = COMPUTER_MARKER
  else
    brd[square] = COMPUTER_MARKER 
  end
end









  square_to_defend = computer_ai_defense(brd)
  if square_to_defend == 0
    brd[location] = COMPUTER_MARKER
  else
    brd[square_to_defend] = COMPUTER_MARKER
  end
end
