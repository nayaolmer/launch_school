require 'pry'

class CustomSet

  attr_accessor :elements

  def initialize(elements = [])
    @elements = elements.uniq
  end

  def empty?
    elements.size == 0
  end

  def contains?(some_value)
    elements.include? some_value
  end

  def subset?(other_set)
    elements.all? {|n| other_set.contains?(n)}
  end

  def disjoint?(other_set)
    elements.none? { |n| other_set.contains?(n)}
  end

  def eql?(other_set)
    elements.sort == other_set.elements.sort
  end

  def ==(other_set)
    elements.sort == other_set.elements.sort
  end

  def add(some_value)
    elements << some_value
    elements.uniq!
    self
  end

  def intersection(other_set)
      CustomSet.new(elements.select { |n| other_set.contains? n })
  end

  def difference(other_set)
    CustomSet.new(elements.select { |n| !other_set.contains? n})
  end

  def union(other_set)
    CustomSet.new((elements + other_set.elements).sort)
  end

end

binding.pry



