

class Scrabble

  def initialize(some_word)
    @my_word = some_word.to_s.strip
  end

  def score
    if @my_word.size <= 0
      return 0
    else
      @my_word.chars.map { |n| get_letter_score(n) }.inject(:+)
    end
  end

  def self.score(input_word)
    Scrabble.new(input_word).score
  end



  def get_letter_score(letter)
    if %w(A E I O U L N R S T).include? letter.upcase
      return 1
    elsif %w(D G).include? letter.upcase
      return 2
    elsif %w(B C M P).include? letter.upcase
      return 3
    elsif %w(F H V W Y).include? letter.upcase
      return 4
    elsif %w(K).include? letter.upcase
      return 5
    elsif %w(J X).include? letter.upcase
      return 8
    elsif %w(Q Z).include? letter.upcase
      return 10
    else
      return 0
    end
  end
end

