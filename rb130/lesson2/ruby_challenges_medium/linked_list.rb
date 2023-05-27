

class Element

  attr_accessor :datum, :next

  def initialize(value, next_element = nil)
    @datum = value
    @next = next_element
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

end


