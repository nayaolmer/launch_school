require "pry"

class Element

  attr_accessor :datum, :next

  def initialize(value, next_element = nil)
    @datum = value
    @next = next_element
  end

  def tail?
    !@next
  end

end



class SimpleLinkedList


  attr_accessor :elements

  def initialize()
    @elements = []
  end

  def push(value)
    next_element = elements.last
    @elements << Element.new(value, next_element)
  end

  def size
    elements.size
  end

  def empty?
    elements.size == 0
  end

  def peek
    if head
      head.datum
    else
      nil
    end
  end

  def head
    elements.last
  end

  def pop
    elements.pop.datum
  end

  def self.from_a(some_arr)
    new_linked_list = SimpleLinkedList.new
    some_arr.reverse.each { |element| new_linked_list.push(element) } if some_arr
    new_linked_list
  end

  def to_a
    elements.map(&:datum).reverse
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end


end


# binding.pry