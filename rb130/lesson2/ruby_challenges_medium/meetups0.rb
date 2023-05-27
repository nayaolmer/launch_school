
require "Date"
require "pry"

class MeetupDate

  DOW = {'Monday'=>1, 'Tuesday'=>2, 'Wednesday'=>3, 'Thursday'=>4,
          'Friday'=>5, 'Saturday'=>6, 'Sunday'=>0}

  DESCRIPTOR = {"First"=>1, "Second"=>2, "Third"=>3, "Fourth"=>4, "Fifth" => 5,
                "Teenth"=>"Teenth"}

  attr_accessor :descriptor, :day_of_week, :dates_of_dow, :desired_dow, :desired_order

  def initialize(descriptor, day_of_week)
    @descriptor = descriptor # first, second, third, fourth, fifth, teenth
    @day_of_week = day_of_week #Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
    @desired_dow = DOW[day_of_week]
    @desired_order = DESCRIPTOR[descriptor]
    @dates_of_dow = {}
  end

  def descriptor=(value)
    @descriptor = value
    @desired_order = DESCRIPTOR[descriptor]
  end

  def get_all_days_of_dow(month, year)
    day_count = 1
    @dates_of_dow = {}
    days_in_month = number_of_days(month, year)

    days_in_month.times do |day0|
      day = day0 + 1
      dow = Date.new(year, month, day).wday
      if dow == desired_dow
        dates_of_dow[day_count] = day
        day_count += 1
      end
      if dow == desired_dow && day > 12 && day < 20
        dates_of_dow['Teenth'] = day
      end
    end

  end

  def return_desired_date(month, year)
    get_all_days_of_dow(month, year)
    day = dates_of_dow[desired_order]
    if day
      return Date.new(year, month, day)
    else
      return "No meeting this month"
    end
  end

  private



  def number_of_days(month, year)
    if month == 2
      if Date.gregorian_leap?(year)
        return 29
      else
        return 28
      end
    elsif [1, 3, 5, 7, 8, 10, 12].include?(month)
      return 31
    else
      return 30
    end
  end

end


binding.pry