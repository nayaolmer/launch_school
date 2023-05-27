

class Robot

  @@used_names = []

  def initialize
    @rob_name = nil
  end


  def name
    return @rob_name if @rob_name
    new_name = sample
    until !@@used_names.include? new_name
      new_name = sample
    end
    USED_NAMES << new_name
    @rob_name = new_name
    new_name
  end

  def reset
    @@used_names.delete(@rob_name)
    @rob_name = nil
  end

  private
    def sample
      letters = ('A'..'Z').to_a.sample(2).join()
      numbers = (0..9).to_a.sample(3).join()
      letters + numbers
    end

end