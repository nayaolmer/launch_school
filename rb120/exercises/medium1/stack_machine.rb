
class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang

  attr_accessor :stack, :register, :command, :commands

  def initialize(command)
    @stack = []
    @register = 0
    @command = command
    @commands = command.split
  end

  def eval
    commands.each do |command|
      if

  def place_n(some_value)
    self.register = some_value
  end

  def push
    stack.push(register)
  end

  def add
    self.register = register + pop
  end

  def subtract
    self.register = register - pop
  end

  def mult
    self.register = register * pop
  end

  def div
    self.register = register / pop
  end

  def mod
    self.register = register % pop
  end

  def pop
    if register.length == 0
      raise EmptyStackError
    else
      self.register = stack.pop
    end
  end

  def print
    puts register
  end


end

# Minilang.new('PRINT').eval
# # 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# # # 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)