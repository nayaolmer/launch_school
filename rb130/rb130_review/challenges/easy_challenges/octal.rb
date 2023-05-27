
require "pry"

class Octal

  def initialize(some_number)
    @number = some_number
  end

  # def to_decimal
  #   return 0 if !is_valid?
  #   counter = 0
  #   array = @number.to_s.reverse.chars.map do |num|
  #     multiplier = 8**counter
  #     return_value = multiplier * num.to_i
  #     counter += 1
  #     return_value
  #   end
  #   array.sum
  # end

  def to_decimal
    return 0 if !valid_octal?(@number)
    digits = @number.to_i.digits
    octal = 0
    digits.each_with_index do |num, idx|
      octal += (num * (8 **idx))
    end
    octal
  end

  private

  def is_numeric?
    true if Integer(@number) rescue false
  end

  def is_octal?
    true if !@number.include?('8') && !@number.include?('9')
  end

  def is_valid?
    true if self.is_numeric? && self.is_octal?
  end

  def valid_octal?(num)
    num.chars.all? {|n| n =~ /[0-7]/}
  end

end

# binding.pry

# counter = 0
# x.to_s.reverse.chars.map do |num|
#   puts "-------"
#   puts "Counter: #{counter}"
#   multiplier = 8**counter
#   puts "Multiplier: #{multiplier}"
#   puts "Integer: #{num}"
#   return_value = num.to_i * multiplier
#   puts "Return value: #{return_value}"
#   counter += 1
# end