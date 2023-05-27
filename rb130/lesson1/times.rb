## Build a times method


def times(num)
  count = 0
  loop do
    yield(count)
    count += 1
    break if count == num
  end
end

times(5) {|x| puts x}
