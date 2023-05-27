

birds = %w(raven finch hawk eagle)
# p birds # => ['raven','finch','hawk','eagle']

# raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p hawk # => 'hawk'
# p eagle # => 'eagle'

# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']

def make_raptors(some_array)
  yield(some_array)
end

make_raptors(birds) {|_, _, *raptors| p raptors}

