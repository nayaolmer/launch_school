def shout_out_to(name)
  puts "HEY #{name.chars.each { |c| c.upcase! }.join()}"
end

shout_out_to('you') # expected: 'HEY YOU'