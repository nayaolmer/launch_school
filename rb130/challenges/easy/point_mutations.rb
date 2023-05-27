

class DNA

  attr_accessor :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    distance = 0
    if strand.size == 0 || other.size == 0
      return 0
    elsif strand.size <= other.size
      side1 = strand.chars
      side2 = other.chars
    else
      side1 = other.chars
      side2 = strand.chars
    end

    side1.each_with_index do |item, idx|
      distance += 1 if item != side2[idx]
    end
    return distance
  end

end