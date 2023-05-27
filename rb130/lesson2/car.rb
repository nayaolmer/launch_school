class Car
  attr_accessor :wheels, :color

  def initialize
    @wheels = 4
    @color = "blue"
  end
end

class Honda < Car
end
