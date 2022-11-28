


def triangle(num_stars, position = 'BL')
  if position == 'BL'
    stars = 1
    num_of_spaces = num_stars - 1
    num_stars.times do
      puts "#{" " * num_of_spaces}#{"*" * stars}"
      stars += 1
      num_of_spaces -= 1
    end

  elsif position == 'TR'
    stars = num_stars
    spaces = 0
    num_stars.times do
      puts("#{"*" * stars}#{" " * spaces}")
      spaces += 1
      stars -= 1
    end

  elsif position == 'TL'
    stars = num_stars
    spaces = 0
    num_stars.times do
      puts("#{" " * spaces}#{'*' * stars}")
      spaces += 1
      stars -= 1
    end
  elsif position == 'BR'
    stars = 1
    num_of_spaces = num_stars - 1
    num_stars.times do
      puts "#{"*" * stars}#{" " * num_of_spaces}"
      stars += 1
      num_of_spaces -= 1
    end
  end
end

triangle(5, 'TR')
triangle(9,'BR')
triangle(3, 'TL')