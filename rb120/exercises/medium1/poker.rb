
require "pry"

class Card
  include Comparable
  attr_reader :rank, :suit

  SUITES = {'Spades' => 4,
            'Hearts' => 3,
            'Clubs' => 2,
            'Diamonds' => 1}

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def rank_score
    if (2..10).include? rank
      rank
    elsif rank == 'Jack'
      11
    elsif rank == 'Queen'
      12
    elsif rank == 'King'
      13
    elsif rank == 'Ace'
      14
    end
  end

  def suit_score
    SUITES.fetch(suit)
  end


  def <=> (other)
    if self.rank_score == other.rank_score
      self.suit_score <=> other.suit_score
    else
      self.rank_score <=> other.rank_score
    end
  end

  def == (other)
    self.rank == other.rank && self.suit == other.suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

end


class Deck

  attr_accessor :cards

  RANKS = ((2..10).to_a + %w( Jack Queen King Ace )).freeze
  SUITS = %w( Hearts Clubs Diamonds Spades ).freeze

  def initialize
    reset
  end

  def reset
    @cards = []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

  def draw
    if cards.length == 0
      reset
    end
    cards.pop
  end


end

# Include Card and Deck classes from the last two exercises.

class PokerHand

  attr_accessor :hand, :suits, :ranks, :rank_counts, :difference_between_cards

  def initialize(deck)
    @cards = []
    5.times do
      card = deck.draw
      @cards << card
    end

    @hand = @cards.sort
    @suits = []
    @ranks = []
    @ranks_num = []
    @rank_counts = {}
    @difference_between_cards = []
    @hand.each do |card|
      @suits << card.suit
      @ranks << card.rank
      @ranks_num << card.rank_score
      if @rank_counts[card.rank]
        @rank_counts[card.rank]+= 1
      else
        @rank_counts[card.rank] = 1
      end
    end
    @ranks_num.each_with_index do |r, idx|
      @difference_between_cards << @ranks_num[idx + 1] - r if idx < 4
    end
  end

  def print
    puts @hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    suits.uniq.length == 1 && ranks == [10, "Jack", "Queen", "King", "Ace"]
  end

  def straight_flush?
    suits.uniq.length == 1 && difference_between_cards.all? {|d| d == 1}
  end

  def four_of_a_kind?
    rank_counts.any? {|k, v| v == 4}
  end

  def full_house?
    rank_counts.any? {|k, v| v == 3} && rank_counts.any? {|k, v| v == 2}
  end

  def flush?
    suits.uniq.length == 1 && !(difference_between_cards.all? {|d| d == 1})
  end

  def straight?
    suits.uniq.length > 1 && difference_between_cards.all? {|d| d == 1}
  end

  def three_of_a_kind?
    rank_counts.any? {|k, v| v == 3} && !(rank_counts.any? {|k, v| v == 2})
  end

  def two_pair?
    rank_counts.select {|k, v| v == 2}.length == 2
  end

  def pair?
    rank_counts.select {|k, v| v == 2}.length == 1
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end


# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])


# puts 'Royal flush'
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
# puts 'Straight flush'
puts hand.evaluate == 'Straight flush'

# binding.pry


hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
# puts 'Four of a kind'
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
# puts 'Full house'
puts hand.evaluate == 'Full house'

# binding.pry

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
# puts 'Flush'
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
# puts 'Straight'
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
# puts 'Straight'
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
# puts 'Three of a kind'
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
# puts 'Two pair'
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
# puts 'Pair'
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
# puts 'High card'
puts hand.evaluate == 'High card'