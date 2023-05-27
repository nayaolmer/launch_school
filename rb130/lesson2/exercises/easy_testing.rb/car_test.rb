require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
    @volvo = Volvo.new
  end


  def test_inheritance
    assert_kind_of(Car, @volvo)
  end
end


