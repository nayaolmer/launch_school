require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    _(car.wheels).must_equal 4
  end
  it 'is the color blue' do
    car = Car.new
    _(car.color).must_equal 'blue'
  end
end
