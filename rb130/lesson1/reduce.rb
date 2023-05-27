
[1, 2, 3].reduce { |acc, num| acc + num} #=> 6

[1, 2, 3].reduce(10) { |acc, num| acc + num} #=> 16


def reduce(some_array, initial_acc = some_array[0])
  counter = 1
  acc = initial_acc
  while counter < some_array.length
    acc = yield(acc, some_array[counter])
    counter += 1
  end
  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']