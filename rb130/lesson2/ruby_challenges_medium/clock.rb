
require "pry"
class Clock

  MIN_IN_DAY = 24*60

  attr_reader :hours, :minutes, :total_minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
    @total_minutes = total_time_in_min
  end

  def total_time_in_min
    hours*60 + minutes
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  def self.at(input_hours, input_minutes = 0)
    new(input_hours, input_minutes)
  end

  def +(add_mins)
    new_total_minutes = @total_minutes + add_mins
    new_hours = (new_total_minutes / 60) % 24
    new_minutes = new_total_minutes
    until new_minutes < 60
      new_minutes -= 60
    end
    Clock.new(new_hours, new_minutes)
  end

  def -(sub_mins)

end



binding.pry