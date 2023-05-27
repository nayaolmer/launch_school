

class Anagram

  def initialize(original_word)
    @original_word = original_word
    @letters = original_word.downcase.chars.sort
  end

  def match(some_list)
    some_list.select do |item|
      item_letters = item.downcase.chars.sort
      item_letters == @letters && item.downcase != @original_word.downcase
    end
  end
end



