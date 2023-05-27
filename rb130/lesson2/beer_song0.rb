=begin

Our goal is to create a program that can generate lyrics of any verse of the
beer song. A verse consists of the number of beer bottles we started with

verse(99) == "99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n"

There's a special case for when there is just 1 bottle of beer on the wall

"1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"

There's another special case for when there are zero beer bottles left

"No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

Our <<verse>> function should be able to generate any number of verses
Our <<lyrics>> function should return all the lyrics to the song.

=end

require "pry"
class BeerSong

  def self.verse(*beer_bottle_ct)
    output = ''
    lyrics_count = 0
    beer_bottle_ct.each do |n|
      output << "\n" if lyrics_count > 0
      if n > 2
        output << "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
                  "Take one down and pass it around, #{n - 1} bottles of beer on the wall.\n"

      elsif n == 2
        output << "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
                  "Take one down and pass it around, #{n - 1} bottle of beer on the wall.\n"

      elsif n == 1
        output << "#{n} bottle of beer on the wall, #{n} bottle of beer.\n" \
                  "Take it down and pass it around, no more bottles of beer on the wall.\n"
      elsif n == 0
        output << "No more bottles of beer on the wall, no more bottles of beer.\n" \
                  "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
      lyrics_count += 1
    end
    output
  end

  def self.verses(start_verse, end_verse)
    range = (end_verse..start_verse).to_a.reverse
    self.verse(*range)
  end

  def self.lyrics
    self.verses(99,0)
  end

end


# binding.pry

# p BeerSong.verses(2, 0)
# p BeerSong.verses(2, 0) == "2 bottles of beer on the wall, 2 bottles of beer.\n" \
# "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
# "\n" \
# "1 bottle of beer on the wall, 1 bottle of beer.\n" \
# "Take it down and pass it around, no more bottles of beer on the wall.\n" \
# "\n" \
# "No more bottles of beer on the wall, no more bottles of beer.\n" \
# "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

# p BeerSong.verses(99, 98) == "99 bottles of beer on the wall, 99 bottles of beer.\n" \
# "Take one down and pass it around, 98 bottles of beer on the wall.\n" \
# "\n" \
# "98 bottles of beer on the wall, 98 bottles of beer.\n" \
# "Take one down and pass it around, 97 bottles of beer on the wall.\n"



# # "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
# # "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\n1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
# "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n\\n1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n\\nNo more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"