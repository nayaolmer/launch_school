module Yell
  def yell(what_i_said)
    puts "#{what_i_said.upcase}!"
  end
end

class MyClass
  include Yell
end

my_object = MyClass.new

my_object.yell('Hello')


