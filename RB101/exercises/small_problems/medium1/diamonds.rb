


def build_line(star_number, space_number)
  stars = "*" * star_number
  spaces = " " * space_number
  "#{spaces}#{stars}#{spaces}"
end

def print_diamond(lines_to_print)
  lines_to_print.each { |n| puts n}
end

def diamond(n_size)
  lines_arr = []
  middle_line = build_line(n_size, 0)
  lines_arr << middle_line

  ## set initial conditions
  star_count = n_size - 2
  space_count = (n_size - star_count)/2

  while star_count > 0
    new_line = build_line(star_count, space_count)
    lines_arr.prepend(new_line)
    lines_arr.append(new_line)
    star_count -= 2
    space_count += 1
  end

  print_diamond(lines_arr)
end

diamond(1)
diamond(3)
diamond(5)
diamond(7)
diamond(9)



