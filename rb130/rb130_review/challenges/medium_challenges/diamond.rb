

require "pry"

class Diamond

  def self.make_diamond(some_letter)
    return "A\n" if some_letter == 'A'

    lines = []
    counter = 0
    'A'.upto(some_letter).each do |letter|
      lines << construct_line(letter, counter)
      counter += 2 if counter > 0
      counter += 1 if counter == 0
    end
    lines += lines[0...-1].reverse
    lines.map { |line| line.center(counter)}.join("\n") + "\n"
  end

  class << self
    private

      def construct_line(letter, spaces)
        if spaces == 0
          letter
        else
          letter + ' '*spaces + letter
        end
      end
  end
end


# lines = []
# counter = 0
# 'A'.upto('D').each do |letter|
#   puts counter
#   puts construct_line(letter, counter)
#   lines << construct_line(letter, counter)
#   counter += 1 if counter == 0
#   counter += 2 if counter > 0
# end
# lines += lines[0...-1].reverse
# lines.map { |line| line.center(counter)}.join("\n")