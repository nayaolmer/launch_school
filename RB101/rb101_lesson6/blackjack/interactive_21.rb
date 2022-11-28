require "pry"

=begin
Concepts to code:
Constants:
>> Card deck
>> value of cards

Variables
>> Player hand cards and values
>> Dealer hand cards and values

Rules
>> When player hits or stays
>> When Dealer hits or stays

methods
>> Dealing hands

=end


### Start by creating card deck

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

##### Methods to total hand values

def possible_ace_values(num_of_aces)
  ace_values = [1, 11]
  base_of_combos = []

  num_of_aces.times do
    base_of_combos << 1
    base_of_combos << 11
  end
  all_combos = []
  base_of_combos.combination(num_of_aces) {|combination| all_combos << combination}
  unique_sums = all_combos.map { |combo| combo.sum }.select { |n| n < 21 }.uniq.sort
  unique_sums
end

def determine_hand_value(hand)
  cards = %w( 2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  suites = %w(Diamond Hearts Spades Clubs)
  full_deck = suites.map { |suite| cards.map { |card| "#{card} - #{suite}" } }.flatten
  simple_values = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7,
                  "8" => 8, "9" => 9, "10" => 10, "Jack" => 10, "Queen" => 10, "King" => 10 }

  full_deck_values = Hash.new
  full_deck.each { |card| full_deck_values[card] = simple_values[card.split(' - ')[0]] }

  aces, non_aces = hand.partition {|card| card.split(' - ')[0] == 'Ace'}
  non_aces_values = non_aces.map { |card| full_deck_values[card]}.sum
  possible_ace_additions = possible_ace_values(aces.length)
  closest_to_21_total = possible_ace_additions.map {|n| n + non_aces_values}.select { |n| n <= 21 }.max
  closest_to_21_total = possible_ace_additions.map {|n| n + non_aces_values}.min if !closest_to_21_total
  closest_to_21_total
end




################## Hit or Stay Logic
### Player Logic
=begin
STAY if:
(1) player hand between 17 and 20
(2) player hand between 13 and 16 AND dealer shows 2, 3, 4, 5, 6
(3) player hand == 12 AND dealer shows 4, 5, 6
Otherwise, HIT
=end

def player_hit_or_stay(current_player, player_hand, dealer_hand)
  dealer_hand_value = determine_hand_value(dealer_hand)
  player_hand_value = determine_hand_value(player_hand)
  action = nil

  if current_player == 'Player'
    if player_hand_value >= 17
      action = 'Stay'
    elsif [13, 14, 15, 16].include?(player_hand_value) && [2, 3, 4, 5, 6].include?(dealer_hand[1])
      action = 'Stay'
    elsif player_hand_value == 12 && [4, 5, 6].include?(dealer_hand[0])
      action = 'Stay'
    else
      action = 'Hit'
    end
  elsif current_player == 'Dealer'
    if dealer_hand_value < 17
      action = 'Hit'
    else
      action = 'Stay'
    end
  end
  action
end

def determine_winner(player_card_value, dealer_card_value)
  winner = nil
  prompt_to_return = nil
  if player_card_value > 21 && dealer_card_value > 21
    winner = 'Tie'
    prompt_to_return = 'Both the dealer and the player busted! Tie!'
  elsif player_card_value > 21 && dealer_card_value <= 21
    winner = 'Dealer'
    prompt_to_return = 'Player busted! Dealer wins.'
  elsif player_card_value <= 21 && dealer_card_value > 21
    winner = 'Player'
    prompt_to_return = 'Dealer busted! Player wins.'
  elsif player_card_value == dealer_card_value
    winner = 'Tie'
    prompt_to_return = 'It was a tie!'
  elsif player_card_value < dealer_card_value
    winner = 'Dealer'
    prompt_to_return = 'Dealer won!'
  elsif player_card_value > dealer_card_value
    winner = 'Player'
    prompt_to_return = 'Player won!'
  else
    winner = nil
    prompt_to_return = 'Something went wrong'
  end
  [winner, prompt_to_return]
end

prompt("Welcome to 21!")
player_score = 0
dealer_score = 0

loop do
  prompt("Current Score:")
  prompt("Player: #{player_score}")
  prompt("Dealer: #{dealer_score}")

  playing_deck = shuffle_cards(full_deck)

  player_hand = []
  dealer_hand = []

  ### Deal cards
  dealer_hand << deal_card!(playing_deck)
  player_hand << deal_card!(playing_deck)
  dealer_hand << deal_card!(playing_deck)
  player_hand << deal_card!(playing_deck)

  prompt("Player cards are: #{player_hand.join(', ')}")
  prompt("Dealer card is: #{dealer_hand[1]}")

  player_action_taken = nil
  dealer_action_taken = nil

  prompt("Now the player will play their hand.")

  loop do
    prompt("Select Hit or Stay. Recommended action is #{player_hit_or_stay('Player', player_hand, dealer_hand)}.")

    player_action_taken = gets.chomp.to_s
    until ['hit', 'stay'].include? player_action_taken.downcase
      prompt("Invalid action selected. Please select either Hit or Stay.")
      player_action_taken = gets.chomp.to_s
    end

    prompt("Action taken: #{player_action_taken}")
    break if player_action_taken.downcase == 'stay'
    player_hand << deal_card!(playing_deck)
    prompt("Player hand is now: #{player_hand.join(', ')}")
    prompt("Player hand totals: #{determine_hand_value(player_hand)}")
    prompt('Player busts!') if determine_hand_value(player_hand) > 21
    break if determine_hand_value(player_hand) >= 21
  end

  prompt("Now the dealer will play their hand.")
  prompt("Dealer's cards are: #{dealer_hand.join(', ')}")

  loop do
    dealer_action_taken = player_hit_or_stay('Dealer', player_hand, dealer_hand)
    prompt("Action taken: #{dealer_action_taken}")
    break if dealer_action_taken == 'Stay'
    dealer_hand << deal_card!(playing_deck)
    prompt("Dealer's hand is now: #{determine_hand_value(dealer_hand)}")
    break if determine_hand_value(dealer_hand) >= 21
  end

  winner = determine_winner(determine_hand_value(player_hand), determine_hand_value(dealer_hand))[0]
  prompt(determine_winner(determine_hand_value(player_hand), determine_hand_value(dealer_hand))[1])

  player_score += 1 if winner == 'Player'
  dealer_score += 1 if winner == 'Dealer'

  prompt('Play again? Enter Y/N')

  play_again = gets.chomp.to_s

  break if !play_again.downcase.start_with?('y')
end

prompt("Goodbye!")
