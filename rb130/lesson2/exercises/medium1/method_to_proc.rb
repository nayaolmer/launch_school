

# comparator = proc { |a, b| b <=> a }

# array.sort { |a, b| b <=> a }

# # >> we can replace the block we passed by simply passing in the proc object comparator

# array.sort(comparator) #>> This will fail because comparator is a proc, not a block

# ## Instead, convert the proc to a block using &
# array.sort(&comparator)

=begin

now we have to figure out how the octal numeral system works (base-9 number system)
>> basically it's like base-2 but it's base 8. So you can do numbers 0-7 and then you
  go up to the next place
  You have 0ths place, 8th's place, 64th's place 8^3rd, 8^4th and so on
#
=end

## write a method that converts a number to base 8

def convert_to_base8(some_number)
  # some_number.digits(8).reverse.map {|n| n.to_s}.join().to_i
  some_number.to_s(8).to_i
end


p convert_to_base8(7) == 7
p convert_to_base8(8) == 10
p convert_to_base8(74) == 112


base8_proc = method(:convert_to_base8).to_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc) == [10, 12, 14, 16, 20, 41]
