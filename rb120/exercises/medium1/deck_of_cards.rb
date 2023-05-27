
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


deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13


binding.pry
drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.