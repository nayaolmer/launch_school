
class Anagram
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def match(list)
    list.select do |n|
      n.downcase.chars.sort == word.downcase.chars.sort && n.downcase != word.downcase
    end
  end

  end