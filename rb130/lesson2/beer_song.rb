
require "pry"

class Verse

  attr_reader :bottles

  def initialize(bottle_count)
    @bottles = bottle_count
    # @verse = single_verse
  end

  def single_verse ## in the case that only one verse is asked for
    case bottles
    when 0
      zero_bottle_verse
    when 1
      one_bottle_verse
    when 2
      two_bottle_verse
    else
      default_verse
    end
  end

  def default_verse
    "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" +
    "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"
  end

  def two_bottle_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def one_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def zero_bottle_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" +
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

end


class BeerSong

  def self.verse(b)
    Verse.new(b).single_verse
  end

  def self.verses(start_b, end_b)
    verses = (end_b..start_b).to_a.reverse
    output = []
    verses.each do |verse|
      output << Verse.new(verse).single_verse
    end
    output.join("\n")
  end

  def self.lyrics
    verses(99,0)
  end

end

# binding.pry