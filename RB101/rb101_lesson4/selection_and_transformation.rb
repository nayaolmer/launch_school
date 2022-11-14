# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
# ### select_fruit is a method that returns all the key-value pairs where the value == fruit


# hash_input = produce
# counter = 0
# keys_with_fruit_value = []
# keys_to_loop = hash_input.keys
# results = {}
# loop do
#   if hash_input[keys_to_loop[counter]] == 'Fruit'
#     results[keys_to_loop[counter]] = hash_input[keys_to_loop[counter]]
#   end
#   counter += 1
#   break if counter == hash_input.length
# end

# puts results.inspect



def double_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * 2

    counter += 1
  end

  doubled_numbers
end

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

end

my_numbers = [1, 4, 3, 7, 2, 6]

double_numbers!(my_numbers)


def double_numbers_odd_idx(numbers)
  counter = 0
  loop do
    numbers[counter] *= 2 if counter.odd?
    counter += 1
    break if counter == numbers.length 
  end

  numbers
end
my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers_odd_idx(my_numbers)



def multiply(numbers, amount_to_multiply)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    doubled_numbers << current_number * amount_to_multiply

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
multiply(my_numbers, 6)




def select_letter(string_input, letter_to_find)
  counter = 0
  string_output = ''
  loop do
    # puts string_input[counter]
    string_output << string_input[counter] if string_input[counter] == letter_to_find
    counter += 1
    break if counter == string_input.length
  end
  string_output
end
question = 'How many times does a particular character appear in this sentence?'
select_letter(question, 'a') # => "aaaaaaaa"
select_letter(question, 't') # => "ttttt"
select_letter(question, 'z') # => ""