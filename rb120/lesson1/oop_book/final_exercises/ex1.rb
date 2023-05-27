module Driftable
  def driftable
    puts "I can drift!"
  end
end


class Vehicle
  attr_accessor :color, :current_speed
  attr_reader :year

  @@vehicle_count = 0

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def initialize(y, c, m, v = 0)
    @year = y
    @color = c
    @make = m
    @current_speed = v
    @@vehicle_count += 1
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

  def how_many_vehicles?
    puts "#{@@vehicle_count}"
  end

  private
  def age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  PURPOSE = 'Commuting'
  include Driftable
end

class MyTruck < Vehicle
  PURPOSE = 'Off-roading'
end

jeep = MyCar.new("1998", "Maroon", "Jeep Cherokee")
truck = MyTruck.new("1992", "Silver", "Toyota Tacoma")

jeep.how_many_vehicles?
jeep.driftable

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

# puts jeep.age


class Student
  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(student)
    self.grade > student.grade
  end

  protected
  attr_reader :grade
end

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 80)

puts "Well done!" if joe.better_grade_than?(bob)

# puts joe.grade
# puts bob.grade

