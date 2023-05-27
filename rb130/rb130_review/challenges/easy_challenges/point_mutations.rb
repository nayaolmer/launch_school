

class DNA

  attr_accessor :strand

  def initialize(some_strand)
    @strand = some_strand
  end

  def hamming_distance(other_strand)
    iterator_length = [strand.size, other_strand.size].min
    counter = 0
    errors = 0
    while counter < iterator_length
      value1 = strand[counter]
      value2 = other_strand[counter]
      errors += 1 if value1 != value2
      counter += 1
    end

    return errors
  end

end

