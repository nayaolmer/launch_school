require "pry"


def display_board(current_board)
  i = 0
  current_board.each do |row|
    row_to_print = "| #{row[0]} | #{row[1]} | #{row[2]} | #{row[3]} |"
    border = ''
    row_to_print.length.times {|n| border << '-'}
    puts border if i == 0
    puts row_to_print
    puts border
    i += 1
  end
end

game_board =  [['-', 'A', 'B', 'C'],
               ['1', ' ', ' ', ' '],
               ['2', ' ', ' ', ' '],
               ['3', ' ', ' ', ' ']]



### Welcome message
puts "Welcome to Tic Tac Toe!"
puts "Here is what the board currently looks like: "

display_board(game_board)

puts "Please select the row you'd like to update with your piece. Choose 1, 2, or 3"
row_to_update = gets.chomp.to_i 

puts "Please select the column you'd like to update with your piece. Choose A, B, or C"
col_to_update_input = gets.chomp.to_s

col_to_update = 0
case col_to_update_input
when "A" then col_to_update = 1
when "B" then col_to_update = 2
when "C" then col_to_update = 3
end

binding.pry
puts col_to_update
game_board[row_to_update][col_to_update] = 'X'

puts "Board has been updated. Check out the new board: "

display_board(game_board)
