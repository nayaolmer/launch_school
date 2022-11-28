require 'pry'

cards = %w( 2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
suites = %w(Diamond Hearts Spades Clubs)

full_deck = suites.map { |suite| cards.map { |card| "#{card} - #{suite}" } }.flatten

simple_values = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7,
                "8" => 8, "9" => 9, "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10 }

full_deck_values = Hash.new

full_deck.each { |card| full_deck_values[card] = simple_values[card.split(' - ')[0]] }

def prompt(msg)
  puts "=> #{msg}"
end

def shuffle_cards(deck)
  deck.shuffle
end

def deal_card!(deck)
  deck.shift(1)[0]
end

playing_deck = shuffle_cards(full_deck)

player_hand = []
dealer_hand = []

### Deal cards
dealer_hand << deal_card!(playing_deck)
player_hand << deal_card!(playing_deck)
dealer_hand << deal_card!(playing_deck)
player_hand << deal_card!(playing_deck)

def calc_hand_value(cards_held)
  cards = %w( 2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  suites = %w(Diamond Hearts Spades Clubs)

  full_deck = suites.map { |suite| cards.map { |card| "#{card} - #{suite}" } }.flatten

  simple_values = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7,
                "8" => 8, "9" => 9, "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10 }

  full_deck_values = Hash.new

  full_deck.each { |card| full_deck_values[card] = simple_values[card.split(' - ')[0]] }

  running_total = 0
  cards_held.each do |card|
    if full_deck_values[card]
      running_total += full_deck_values[card]
    else
      running_total += 11
    end
  end
  cards_held.select {|card| card.split(' - ')[0] == 'Ace'}.count.times do
    if running_total > 21
      running_total -= 10
    end
  end
  running_total
end


binding.pry

