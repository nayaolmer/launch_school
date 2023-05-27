

class MyCar

  attr_accessor :color, :current_speed
  attr_reader :year

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def initialize(y, c, m, v = 0)
    @year = y
    @color = c
    @make = m
    @current_speed = v
  end

  def speed_up(mph_increase)
    self.current_speed = self.current_speed + mph_increase
  end

  def break(mph_decrease)
    if self.current_speed - mph_decrease > 0
      self.current_speed = self.current_speed - mph_decrease
    else
      self.current_speed = 0
    end
  end

  def shut_off
    self.current_speed = 0
  end

  def spray_paint(c)
    self.color = c
  end

end

jeep = MyCar.new("1998", "Maroon", "Jeep Cherokee", 49)

# puts jeep.current_speed

# jeep.speed_up(100)

# puts jeep.current_speed

# jeep.break(50)

# puts jeep.current_speed

# jeep.shut_off

# puts jeep.current_speed

# jeep.color = 'Avenger Red'

# puts jeep.year
# puts jeep.color
# jeep.spray_paint('Black')
# puts jeep.color

MyCar.gas_mileage(13, 351)
