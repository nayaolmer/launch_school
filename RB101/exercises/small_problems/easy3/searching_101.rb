=begin
Write a program that solicits 6 numbers from the user,
then prints a message that describes whether or not the
6th number appears amongst the first 5 numbers.
=end

def prompt(msg)
  puts "=> #{msg}"
end

prompt("Welcome to Searching 101!")

def get_numbers(number_count)
  print_n = { '1': "1st", '2': "2nd", '3': "3rd",
              '4': "4th", '5': "5th", '6': "6th" }
  n = 1
  numbers = []
  number_count.times do
    puts "Enter the #{print_n[n.to_s.to_sym]} number:"
    number = gets.chomp.to_i
    numbers << number
    n += 1
  end
  numbers
end

loop do
  our_numbers = get_numbers(6)

  if our_numbers[0...5].include? our_numbers[-1]
    prompt("The number #{our_numbers[-1]} appears in " + \
            our_numbers[0..5].join(', ').to_s)
  else
    prompt("The number #{our_numbers[-1]} does not appear in " + \
          our_numbers[0..5].join(', ').to_s)
  end

  prompt("Continue? Y/N")
  go_again = gets.chomp.to_s
  break if !go_again.downcase.start_with? "y"
end

prompt('Goodbye!')
