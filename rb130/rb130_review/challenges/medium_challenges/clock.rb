require "pry"

class Clock


  attr_accessor :hours, :minutes

  def self.at(hours = 0, minutes = 0)
    Clock.new(hours, minutes)
  end

  def to_s
    if hours.to_s.size == 1
      hours_str = "0#{hours}"
    else
      hours_str = hours.to_s
    end

    if minutes.to_s.size == 1
      minutes_str = "0#{minutes}"
    else
      minutes_str = minutes.to_s
    end

    "#{hours_str}:#{minutes_str}"
  end

  def + minutes_to_add
    current_time_in_minutes = hours*60 + minutes
    new_time_in_minutes = current_time_in_minutes + minutes_to_add
    new_hours, new_mins = convert_total_min_to_time(new_time_in_minutes)
    Clock.at(new_hours, new_mins)
  end

  def - minutes_to_subtract
    current_time_in_minutes = hours*60 + minutes
    new_time_in_minutes = (current_time_in_minutes - minutes_to_subtract) % 1440
    new_hours, new_mins = convert_total_min_to_time(new_time_in_minutes)
    Clock.at(new_hours, new_mins)
  end

  def ==(other_clock)
    hours == other_clock.hours && minutes == other_clock.minutes
  end



  private

  def convert_total_min_to_time(total_time_in_minutes)
    output_minutes = total_time_in_minutes % 60
    total_hours = (total_time_in_minutes - output_minutes)/60
    output_hours = total_hours % 24
    return output_hours, output_minutes
  end

  def initialize(hours = 0, minutes = 0 )
    @hours = hours
    @minutes = minutes
  end

end



