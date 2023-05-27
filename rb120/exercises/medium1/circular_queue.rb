
require "pry"

class CircularQueue

  attr_accessor :buffer_size, :elements, :idx_history, :historical_location, :newest_spot

  def initialize(buffer_size)
    @buffer_size = buffer_size
    @elements = [nil] * buffer_size
    @idx_history = []
    @newest_spot = nil
    @historical_location = 0
  end

  def enqueue(value_to_add)
    puts "Adding #{value_to_add}"
    if !newest_spot
      elements[0] = value_to_add
      self.newest_spot = 0
      idx_history << newest_spot
    else
      dequeue until elements.index(nil)

      second_half_nil = elements[newest_spot..-1].index(nil)
      first_half_nil = elements[0..newest_spot].index(nil)

      if second_half_nil
        element_to_change = second_half_nil + newest_spot
        elements[element_to_change] = value_to_add
        self.newest_spot = element_to_change
        idx_history << element_to_change
      elsif first_half_nil
        elements[first_half_nil] = value_to_add
        self.newest_spot = first_half_nil
        idx_history << first_half_nil
      else
        puts "something went wrong here"
      end
    end
  end

  def dequeue
    if elements.all? {|n| n.nil?}
      nil
    else
      idx_of_oldest_element = idx_history[historical_location]
      element_to_remove = elements[idx_of_oldest_element]
      elements[idx_of_oldest_element] = nil
      self.historical_location += 1
      element_to_remove
    end
  end

end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
