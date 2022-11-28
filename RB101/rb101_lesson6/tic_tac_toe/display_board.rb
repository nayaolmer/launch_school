require 'pry'


board = [[' ', ' ', ' '],
         [' ', ' ', ' '],
         [' ', ' ', ' ']]

board_2 = [['X', ' ', ' '],
           [' ', ' ', ' '],
           [' ', ' ', ' ']]




def display_board(current_board)
  i = 0
  current_board.each do |row|
    row_to_print = "| #{row[0]} | #{row[1]} | #{row[2]} |"
    border = ''
    row_to_print.length.times {|n| border << '-'}
    puts border if i == 0
    puts row_to_print
    puts border
    i += 1
  end
end

display_board(board)
display_board(board_2)