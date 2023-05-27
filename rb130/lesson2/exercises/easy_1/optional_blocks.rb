


def compute(some_input)
  if block_given?
    yield(some_input)
  else
    "Does not compute."
  end
end


p compute { |n| n + n } == 8
p compute { |n| 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'