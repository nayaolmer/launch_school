



def star(star_count)
  countdown_lines = (star_count - 1) / 2 ## 3 for 7, 4 for 9, 5 for 11
  countdown_lines.downto(1).to_a.each do |n|
    puts Array.new(3, '*').join((' ' * (n - 1))).center(star_count)
  end
  puts '*' * star_count
  (1..countdown_lines).to_a.each do |n|
    # puts ('*' + (' ' * (n-1)) + '*' + (' ' * (n-1)) + '*').center(star_count)
    puts Array.new(3, '*').join((' ' * (n - 1))).center(star_count)
  end
end

star(7)
puts '---' * 15
star(9)

puts '---' * 15

star(11)
puts '---' * 15
star(13)