
# def sequence(some_number)
#   (1..some_number).to_a
# end


def sequence(some_number)
  some_number > 0 ? (1..some_number).to_a : (some_number..0).to_a
end










puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]
puts sequence(-5) == [-5, -4, -3, -2, -1, 0]
puts sequence(-3) == [-3, -2, -1, 0]
puts sequence(-1) == [-1, 0]