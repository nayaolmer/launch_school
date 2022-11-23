=begin
Write a method that takes an Array of numbers,
and returns an Array with the same number of elements,
and each element has the running total from the original Array.
=end

# def running_total(user_input)
#   running_total = []
#   user_input.each_with_index do |n, index|
#     running_total << user_input[0..index].sum
#   end
#   running_total
# end

## Use inject
def running_total(user_input)
  run_total = []
  x = user_input.inject do |total, n|
        run_total << total += n
      end



## Examples

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

run_total = []
user_input.inject do |total, n|
  puts "-----n: #{n} -----"
  puts "Old total: #{total}"
  total + n
  puts "new sum: #{total}"
  p "Old array: #{run_total}"
  run_total << total
  p "New array: #{run_total}"
end