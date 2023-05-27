# rubocop:disable Layout/LineLength

=begin

(1) Write a description of the problem

21 is a card game played with a normal deck of 52 cards.

The game is played with a dealer and a player.

Both the dealer and the player are dealt hands of 2 cards. The dealer only has
knowledge of the cards they are dealt. The player has knowledge of both their own
cards and the last card the dealer was dealt.

Once the cards are dealt, the player starts by either asking for additional cards
("hit") or deciding to end their turn ("stay"). The player's goal is to get their
hand closer to 21 than the dealer without going over 21 ("bust"-ing).

Once the player has stayed, the dealer must decide to hit or stay. The dealer follows
a strict protocol for whether to hit or stay: if the total is below 17, the dealer
must hit.

Once the dealer has stayed or busted, each player's hand is pointed and whichever
player is closer to 21 without busting wins. If one of the player's busted, the other
player automatically wins. If both players bust, no one wins and it's a tie.

(2) Extract nouns and verbs

nouns: game, dealer, player, deck
verbs: deal, calculate score, hit, stay, bust

Player
>> hand
>> score
>> is_bust?
// Dealer
>> action (hit, stay)
// Human
>> action (hit, stay)

Deck
>> cards
>> score
>> shuffle

Game
>> overall score
>> play
>> players
>> welcome message
>> play_again?
>> goodbye message

=end

# rubocop:enable Layout/LineLength

require "pry"

class Player
  attr_accessor :hand, :hand_value, :name

  def initialize(name = '')
    @hand = []
    @hand_value = []
    @name = name
  end

  # rubocop disable Metrics/MethodLength
  def calculate_hand_value
    total_points = 0
    hand.each do |card|
      total_points += card.value
    end
    if total_points > 21
      hand.each do |card|
        if card.rank == 'A' && total_points > 21
          total_points -= 10
        end
      end
    end
    self.hand_value = total_points
  end
  # rubocop enable Metrics/MethodLength
end

class Human < Player
  def make_decision
    puts "Would you like to hit or stay?"
    puts "Enter 'H' for hit or 'S' for stay"
    decision = ''
    loop do
      decision = gets.chomp.to_s
      break if ['H', 'S'].include? decision
      puts "Please enter either 'H' or 'S'."
    end
    decision
  end
end

class Dealer < Player
  def make_decision
    decision = ''
    if hand_value < 17
      decision = 'H'
    else
      decision = 'S'
    end
    puts "Dealer decision is: #{decision}"
    return decision
  end
end

class Deck
  attr_accessor :cards_in_deck

  SUITES = ['Hearts', 'Spades', 'Clubs', 'Diamonds']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  def initialize
    @cards_in_deck = []
    SUITES.each do |suit|
      RANKS.each do |rank|
        card_value = ((2..10).include? rank) ? rank : 10
        card_value = 11 if rank == 'A'
        cards_in_deck << Card.new(rank, suit, card_value)
      end
    end
  end
end

class Card
  attr_accessor :rank, :suite, :value

  def initialize(rank, suite, value)
    @rank = rank
    @suite = suite
    @value = value
  end

  def print_info
    puts "#{rank} of #{suite}"
  end
end

class Game
  attr_accessor :human, :dealer, :deck

  def initialize
    @human = Human.new
    @dealer = Dealer.new('Dealer')
    @deck = Deck.new
  end

  def welcome_message
    puts "Welcome to 21!"
  end

  def get_human_name
    puts "Please enter your name:"
    gets.chomp.to_s
  end

  def set_human_name
    human.name = get_human_name
  end

  def shuffle(deck_to_shuffle)
    deck_to_shuffle.cards_in_deck.shuffle!
  end

  def deal_cards(player)
    player.hand << deck.cards_in_deck.pop
    player.calculate_hand_value
  end

  def reveal_player_cards(player)
    puts "#{player.name} cards are:"
    player.hand.each(&:print_info)
  end

  def reveal_dealer_last_card
    puts "Dealer card shown is: "
    dealer.hand[0].print_info
  end

  def display_player_hand_value(player)
    puts "#{player.name} hand value is: #{player.hand_value}"
  end

  def human_turn
    loop do
      display_player_hand_value(human)
      decision = human.make_decision
      if decision == 'H'
        deal_cards(human)
        reveal_player_cards(human)
        display_player_hand_value(human)
      end
      break if decision == 'S'
    end
  end

  def dealer_turn
    loop do
      decision = dealer.make_decision
      if decision == 'H'
        deal_cards(dealer)
        reveal_player_cards(dealer)
        display_player_hand_value(dealer)
      end
      break if decision == 'S'
    end
  end

  def determine_winner(player1, player2)
    if player1.hand_value > 21 && player2.hand_value > 21
      puts "Both players busted, tie."
    elsif player1.hand_value == player2.hand_value
      puts "Players have the same score, tie."
    elsif player1.hand_value > 21 && player2.hand_value <= 21
      puts "#{player1.name} busted, #{player2.name} wins."
    elsif player2.hand_value > 21 && player1.hand_value <= 21
      puts "#{player2.name} busted, #{player1.name} wins"
    elsif player2.hand_value < player1.hand_value
      puts "#{player1.name} has the higher hand. #{player1.name} wins."
    elsif player1.hand_value < player2.hand_value
      puts "#{player2.name} has the higher hand. #{player2.name} wins."
    end
  end

  def play_again?
    puts "Would you like to play again? y/n"
    choice = ''
    loop do
      choice = gets.chomp.to_s
      break if ['y', 'n'].include? choice
      puts "Please enter 'y' or 'n'"
    end
    choice
  end

  def reset_game
    human.hand = []
    dealer.hand = []
    self.deck = Deck.new
    human.hand_value = 0
    dealer.hand_value = 0
  end

  def goodbye_message
    puts "Thanks for playing 21, goodbye!"
  end

  def play
    welcome_message
    set_human_name
    loop do
      shuffle(deck)
      deal_cards(human)
      deal_cards(human)
      deal_cards(dealer)
      deal_cards(dealer)
      reveal_player_cards(human)
      reveal_dealer_last_card
      human_turn
      dealer_turn
      reveal_player_cards(dealer)
      display_player_hand_value(dealer)
      determine_winner(human, dealer)
      break if play_again? != 'y'
      reset_game
    end
    goodbye_message
  end
end

game1 = Game.new
game1.play
