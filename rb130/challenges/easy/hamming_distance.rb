


class HammingTest

  attr_accessor :strand1, :strand2

  def initialize(input1, input2)
    if input1.size <= input2.size
      @strand1 = input1
      @strand2 = input2
    else
      @strand1 = input2
      @strand2 = input1
    end
  end

  def hamming_distance
    distance = 0
    strand1.each_with_index do |item, idx|
      distance += 1 if item != strand2[idx]
    end
    distance
  end

end


