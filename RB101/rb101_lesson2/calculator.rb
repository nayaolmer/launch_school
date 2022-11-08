# Build a command line calculator program that does the following:

# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result

require 'numeric'
require 'yaml'
require 'pry'

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts  " => #{message}"
end

loop do
  prompt(MESSAGES['welcome'])

  prompt(MESSAGES['first_number'])
  first_number = Kernel.gets().chomp()

  until first_number.numeric?
    prompt(MESSAGES['validate_first_number'])
    first_number = Kernel.gets().chomp()
  end

  first_number = first_number.to_f

  prompt(MESSAGES['second_number'])
  second_number = Kernel.gets().chomp()

  until second_number.numeric?
    prompt(MESSAGES['validate_second_number'])
    second_number = Kernel.gets().chomp()
  end

  second_number = second_number.to_f

  operator_prompt = MESSAGES['operator_prompt']

  prompt(operator_prompt)

  action_selection = Kernel.gets().chomp()

  until ["a", "s", "m", "d"].include?(action_selection.to_s)
    prompt(MESSAGES['validate_operation_selection'])
    action_selection = Kernel.gets().chomp()
  end

  action_selection = action_selection.to_s

  case action_selection
  when "a" then
    prompt(MESSAGES['addition_selected'])
    sum = first_number + second_number
    prompt("The sum of #{first_number} and #{second_number} is #{sum}.")
  when "s" then
    prompt(MESSAGES['subtraction_selected'])
    difference = first_number - second_number
    prompt("The difference of #{first_number} and #{second_number} is #{difference}.")
  when "m" then
    prompt(MESSAGES['multiplication_selected'])
    product = first_number * second_number
    prompt("The product of #{first_number} and #{second_number} is #{product}")
  when "d" then
    prompt(MESSAGES['division_selected'])
    until second_number != 0 && second_number.numeric?
      prompt("Please replace the second number with a non-zero number.")
      second_number = Kernel.gets().chomp()
    end
    second_number = second_number.to_f
    division = first_number / second_number
    prompt("The division of #{first_number} and #{second_number} is #{division}.")
  end

  prompt(MESSAGES['perform_another_calc'])
  keep_going = gets.chomp
  break if keep_going.downcase.start_with? 'n'
end
prompt(MESSAGES['goodbye_message'])
