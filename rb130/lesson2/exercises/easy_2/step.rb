


def step(start_idx, end_idx, step)
  count = 0
  loop do
    yield(start_idx + step*count)
    count += 1
    break if (start_idx + step*count) > end_idx
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }


=begin 
What would be a good return value for this method? 

The original method returns the original range. 

I would suggest returning an array with the output of the block.