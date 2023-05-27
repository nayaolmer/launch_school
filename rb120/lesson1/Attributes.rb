class Laptop
  attr_accessor :memory

  def initialize(memory)
    @memory = memory
  end
end

laptop = Laptop.new('8GB')
puts laptop.memory
laptop.memory = '16GB'
puts laptop.memory