

class PerfectNumber

  def self.classify(some_number)
    if some_number <= 0
      raise(SatndardError)
    else
      divisors_sum = 1.upto(some_number-1).select { |n| some_number % n == 0}.sum
      if divisors_sum == some_number
        return 'perfect'
      elsif divisors_sum < some_number
        return 'deficient'
      elsif divisors_sum > some_number
        return 'abundant'
      end
    end
  end

  class << self
    private
    def get_divisors
      1.upto(@number-1).select { |n| @number % n == 0}
    end
end



