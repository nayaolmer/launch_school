

require "pry"
class Clock

  attr_reader :hours, :minutes

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end


  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def convert_to_string(input)
    if input.to_s.size == 1
      '0' + input.to_s
    else
      input.to_s
    end
  end

  def to_s
    convert_to_string(hours) + ':' + convert_to_string(minutes)
  end

  def wrap_midnight(hours)
    if hours > 23
      return (hours - ((hours/24)*24))
    elsif hours < 0
      return (((hours/24)*-24) + hours)
    else
      return hours
    end
  end


  def +(minutes_to_add)
    total_minutes = minutes + minutes_to_add
    if total_minutes < 60
      Clock.new(hours, total_minutes)
    else
      add_hours = total_minutes/60
      new_minutes = total_minutes - (add_hours*60)
      new_hours = wrap_midnight(hours + add_hours)
      Clock.new(new_hours, new_minutes)
    end
  end

  def -(minutes_to_subtract)
    total_minutes = minutes - minutes_to_subtract
    if total_minutes > 0
      Clock.new(hours, total_minutes)
    else
      subtract_hours = total_minutes/60
      new_minutes = total_minutes % 60
      new_hours = wrap_midnight(hours + subtract_hours)
      Clock.new(new_hours, new_minutes)
    end
  end

  def ==(other)
    self.to_s == other.to_s
  end

end

binding.pry





