# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

numbers_to_print = (1..99).to_a

numbers_to_print.each { |n| puts n if n.odd? }