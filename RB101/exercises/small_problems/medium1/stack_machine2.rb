=begin

Functions to program:

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

=end

def minilang(cmmd)
  register = 0
  stack = []

  commands = cmmd.split
  command_total_count = commands.length
  command_tracker = 0

  until command_tracker >= command_total_count
    current_command = commands[command_tracker]
    case
    when current_command.to_i.to_s == current_command then
      register = current_command.to_i
    when current_command == 'PUSH' then
      stack << register
    when current_command == 'ADD' then
      register += stack.pop
    when current_command == 'SUB' then
      register -= stack.pop
    when current_command == 'MULT' then
      register *= stack.pop
    when current_command == 'DIV' then
      register /= stack.pop
    when current_command == 'MOD' then
      register %= stack.pop
    when current_command == 'POP' then
      register = stack.pop
    when current_command == 'PRINT' then
      puts register
    else
      puts "Invalid token"
    end
    if stack.length == 0
      puts "Stack is empty."
    end
    command_tracker += 1
  end
end



minilang('3 PUSH 5 MOD PUSH 3 PUSH 7 PUSH 5 PUSH 4 MULT SUB ADD DIV PRINT')



# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)