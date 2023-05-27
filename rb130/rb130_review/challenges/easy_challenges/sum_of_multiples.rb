

require "pry"
class SumOfMultiples

  def initialize(*input_sets)
    # if input_sets == []
    #   @input_set = [3, 5]
    # else
    #   @input_set = input_sets
    # end
    @input_set = (input_sets.size > 0) ? input_sets : [3, 5]
  end


  def to(input_number)
    return_value = 0
    1.upto(input_number - 1).each do |current_num|
      return_value += current_num if any_multiple?(current_num)
    end

    return_value
  end

  def self.to(input_number)
    SumOfMultiples.new().to(input_number)
  end

  private

  def any_multiple?(num)
    @input_set.any? do |multiple|
      num % multiple == 0
    end
  end


end


# binding.pry
