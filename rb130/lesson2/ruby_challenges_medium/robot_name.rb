
require "pry"


class Robot

  @@names = []

  attr_accessor :name

  def initialize()
    @name = generate_name
  end

  def generate_name
    letters = ('A'..'Z').to_a
    numbers = (0..9).to_a.map(&:to_s)
    new_name = letters.sample + letters.sample + numbers.sample + numbers.sample + numbers.sample
    until !@@names.include?(new_name)
      new_name = letters.sample + letters.sample + numbers.sample + numbers.sample + numbers.sample
    end
    @@names << new_name
    new_name
  end

  def reset
    @name = generate_name
  end
end



# binding.pry

