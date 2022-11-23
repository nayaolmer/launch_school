=begin
Write a method that will take a short line of text, and print it within a box.

print_in_box('To boldly go where no one has gone before.')

+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

=end


# def print_in_box(msg)
#   top_bottom = '+-'
#   (msg.length).times { top_bottom << '-'}
#   top_bottom << '-+'

#   buffer = '| '
#   (msg.length).times {buffer += ' '}
#   buffer << ' |'

#   msg_line = "| #{msg} |"

#   output = "#{top_bottom}\n#{buffer}\n#{msg_line}\n#{buffer}\n#{top_bottom}"
#   output
# end



# def print_in_box(msg)
#   top_bottom = "+-#{'-' * msg.length}-+"
#   buffer = "| #{' ' * msg.length} |"
#   msg_line = "| #{msg} |"
#   output = "#{top_bottom}\n#{buffer}\n#{msg_line}\n#{buffer}\n#{top_bottom}"
# end

# puts print_in_box('To boldly go where no one has gone before. Lets keep going until the message needs to get truncated cause its so damn long')
# puts print_in_box('')

def truncate_print(msg) ## 80 chars only
  msg = msg[0...80]
  # puts msg.length
  top_bottom = "+-#{'-' * msg.length}-+"
  buffer = "| #{' ' * msg.length} |"
  msg_line = "| #{msg} |"
  output = "#{top_bottom}\n#{buffer}\n#{msg_line}\n#{buffer}\n#{top_bottom}"
end

puts truncate_print('To boldly go where no one has gone before. Lets keep going until the message needs to get truncated cause its so damn long')
puts truncate_print('')

def message_wrap(msg)
  lines = []
  ref_msg = msg + ' '
  while lines.join.length < msg.length
    lines << ref_msg[0...80]
    ref_msg = ref_msg[81..-1]
  end

  top_bottom = "+-#{'-' * lines[0].length}-+"
  buffer = "| #{' ' * lines[0].length} |"

  puts top_bottom
  puts buffer
  lines.each do |line|
    spacing_required = (lines[0].length - line.length)
    if spacing_required.odd?
      puts "| #{" " * (spacing_required / 2)}#{line} #{" " * (spacing_required / 2)} |"
    else
      puts"| #{" " * (spacing_required / 2)}#{line}#{" " * (spacing_required / 2)} |"
    end
  end
  puts buffer
  puts top_bottom
end

message_wrap('To boldly go where no one has gone before. Lets keep going until the message needs to get truncated cause its so damn long')
truncate_print('')

