

def initialize_lights(num_of_lights)
  switch_count = (1..num_of_lights).to_a
  switches_state = [false] * num_of_lights ## if the light is OFF, it is false
  switches_hash = switch_count.zip(switches_state).to_h
  switches_hash
end

def find_on_lights(final_hash)
  final_hash.select { |k, v| v }.keys
end

def perform_switch(lights_hash, switch, current_state, current_loop)
  if switch % current_loop == 0
    lights_hash[switch] = !current_state
  else
    lights_hash[switch] = current_state
  end
end


def switch_loop(num_of_lights)
  #Set initial conditions
  switches_hash = initialize_lights(num_of_lights)
  loop_ct = 1
  while loop_ct <= num_of_lights
    switches_hash.each {|k, v| perform_switch(switches_hash, k, v, loop_ct) }
    loop_ct += 1
  end
  find_on_lights(switches_hash)
end

p switch_loop(5)
p switch_loop(10)
p switch_loop(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]


