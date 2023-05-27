class Banner
  attr_reader :message, :message_length, :max_width
  def initialize(message, max_width = nil)
    @message = message
    @message_length = message.length
    @max_width = max_width
  end

  def make_lines


  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-' * (self.message_length + 2)}+"
  end

  def empty_line
    "| #{' ' * self.message_length} |"
  end

  def message_line
    "| #{@message} |"
  end
end


banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner


banner = Banner.new('To boldly go where no one has gone before.', 5)
p banner.max_width

x = 'To boldly go where no one has gone before.'

reference_copy = x.clone.chars

lines = []
while reference_copy.length > 0
  new_line = []
  5.times {new_line << reference_copy.shift}
  new_line = new_line.join
  lines << new_line
end

p lines