

require "pry"

class Diamond
  LETTERS = ('A'..'Z').to_a
  NUMBERS = (1..26).to_a
  ALPHABET_DICT = Hash[LETTERS.zip(NUMBERS)]


  def self.make_diamond(input_letter)
    line_size = ALPHABET_DICT[input_letter]*2 - 1

    space_count = 0
    output = []
    ('A'..input_letter).each do |n|
      if n == 'A'
        output << ('A').center(line_size)
        space_count += 1
      else
        output << (n + " "*space_count +n).center(line_size)
        space_count += 2
      end
    end

    space_count -= 2

    ('A'...input_letter).to_a.reverse.each do |n|
      space_count -= 2
      # puts n
      # puts space_count
      if n == 'A'
        output << 'A'.center(line_size)
      else
        output << (n + " "*space_count +n).center(line_size)
      end
    end
    output.join("\n") + "\n"
  end

end


# binding.pry

