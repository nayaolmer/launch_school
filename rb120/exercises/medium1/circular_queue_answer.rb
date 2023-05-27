
class CircularQueue

  attr_accessor :buffer, :next_position, :oldest_position

  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(value_to_add)
    unless buffer[next_position].nil?
      @oldest_position = increment(@next_position)
    end

    buffer[next_position] = value_to_add
    self.next_position = increment(next_position)

  end

  def dequeue
    value = buffer[oldest_position]
    buffer[oldest_position] = nil
    self.oldest_position = increment(oldest_position) unless value.nil?
    value
  end

  def increment(position)
    (position + 1) % buffer.size
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