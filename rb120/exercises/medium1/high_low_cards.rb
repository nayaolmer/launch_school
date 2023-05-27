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

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

# binding.pry

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.min
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')


# binding.pry

puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
puts cards.min
puts cards.max