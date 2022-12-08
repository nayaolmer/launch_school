# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - 2 * distance_from_center
#   stars = '*' * number_of_stars
#   puts stars.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end

# diamond(5)


def print_line(grid_size, spaces)
  line_length = grid_size - (2*spaces)
  line = " " * line_length
  line[0] = "*"
  line[-1] = "*"
  puts line.center(grid_size)
end


def diamond(grid_size)
  max_spaces = (grid_size - 1)/2
  ## Print out first half
  max_spaces.downto(0) {|spaces| print_line(grid_size, spaces)}
  1.upto(max_spaces) {|spaces| print_line(grid_size, spaces)}
end

diamond(1)
diamond(3)
diamond(5)
diamond(7)
diamond(9)
