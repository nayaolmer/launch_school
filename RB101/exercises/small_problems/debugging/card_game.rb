require "pry"

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.map(&:clone),
         :diamonds => cards.map(&:clone),
         :clubs    => cards.map(&:clone),
         :spades   => cards.map(&:clone) }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  puts suit
  cards = deck[suit]
  p cards
  cards.shuffle!
  player_cards << cards.pop
  p player_cards
end

p player_cards

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  individual_score = remaining_cards.map do |card|
    score(card)
  end

  sum += individual_score.sum
end

puts sum

# binding.pry