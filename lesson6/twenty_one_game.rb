require 'pry'
require 'pry-byebug'

SUITS = [:diamonds, :spades, :hearts, :clubs]

deck = {
        diamonds: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King),
        hearts: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King),
        clubs: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King),
        spades: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
      }

J_K_Q = %w(Jack King Queen)

def prompt(message)
  puts "=> #{message}"
end

def initial_hand!(deck, hand)
  loop do
    break if hand.size == 2
    suit = SUITS.sample
    card = deck[suit].sample
		hand << [suit, card]
		deck[suit].delete(card)
  end
  hand
end

def say_cards_p_has(p_hand)
  p_hand.each do |i|
    prompt("#{i[1]} of #{i[0]}")
  end
end

def say_cards_d_has(d_hand)
  prompt("#{d_hand[0][1]} of #{d_hand[0][0]}")
  prompt("unknown card")
end

def ace_counter(hand)
  v = []
  hand.each do |subarr|
    if subarr.member?('Ace')
      v << 'Ace'
    end
  end
  v
end

def one_ace_in_hand?(hand)
  hand.member?('Ace')
end

def two_aces?(values)
  values.count('Ace') == 2
end

def two_aces_in_initial_hand!(values)
  loop do
    values << 11
    values << 1
    break
  end
  values
end

def default_values!(hand, arr)
  hand.each do |subarr|
    if J_K_Q.member?(subarr[1])
      arr << 10
    elsif subarr.member?('Ace')
      arr << 11
    else
      arr << subarr[1].to_i
    end
  end
end

def last_card_value!(hand, arr)
  if J_K_Q.member?(hand.last[1])
    arr << 10
  elsif hand.last[1] == 'Ace'
    (arr.inject(:+) + 11 ) > 21 ?  arr << 1 : arr << 11
  else
    arr << hand.last[1].to_i
  end
  arr
end

def h_or_s
  input = gets.chomp.downcase
  loop do
    break if input == 's' || input == 'h'
    prompt("Please enter either \'h\' or \'s\'.")
    input = gets.chomp.downcase
  end
  input
end

def get_total(hand)
  hand.inject(:+)
end

def add_card_to_hand!(hand, deck)
  suit = SUITS.sample
  card = deck[suit].sample
  hand << [suit, card]
  deck[suit].delete(card)
  hand
end

def yes_no
  input = gets.chomp.downcase
  loop do
    break if input == 'y' || input == 'n'
    puts("Please enter either \'h\' or \'s\'.")
    input = gets.chomp.downcase
  end
  input
end

def dealer_hit_or_stay(d_sum)
  return d_sum > 17 ? 's' : 'h'
end

def compare_cards(p_hand, d_hand)
  if p_hand > d_hand
    prompt("Player wins!!!!")
  elsif p_hand == d_hand
    prompt("It's a tie!!!!")
  else
    prompt("Dealer wins!!!!")
  end
end

def dealer_shows_hand(hand)
  hand.each do |subarr|
    prompt("#{subarr[1]} of #{subarr[0]}")
  end
end

def play_again
  y_or_n = ''
  prompt("Enter \'y\' or \'n\'.")
  loop do
    y_or_n = gets.chomp.downcase
    break if y_or_n == 'n' || y_or_n == 'y'
    prompt("Incorrect entry. Please enter either \'y\' or \'n\'.")
  end
  y_or_n
end

def reset_deck
  deck = {
      diamonds: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King),
      hearts: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King),
      clubs: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King),
      spades: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
    }
end

def resets_anything(i)
  i.clear
end

players_hand = []
dealers_hand = []
p_card_values = []
d_card_values = []
player_absolute_total = ''
dealer_absolute_total = ''
player_decision = ''
dealer_decision = ''

prompt("Welcome to Twenty-One!")

loop do
  prompt("Your hand is: ")
  initial_hand!(deck, players_hand)
  puts " "
  say_cards_p_has(players_hand)
  arr_of_ace = ace_counter(players_hand)
  puts " "
  if two_aces?(arr_of_ace)
    two_aces_in_initial_hand!(p_card_values)
  else
    default_values!(players_hand, p_card_values)
  end
  player_absolute_total = get_total(p_card_values)

  prompt("Initial total of hand: #{player_absolute_total}")
  puts " "
  prompt("Dealer has: ")
  initial_hand!(deck, dealers_hand)
  say_cards_d_has(dealers_hand)
  puts " "

  loop do
    prompt("Would you like to hit or stay?")
    prompt("Enter \'h\' or \'s\'.")
    player_decision = h_or_s
    if player_decision == 'h'
      add_card_to_hand!(players_hand, deck)
      say_cards_p_has(players_hand)
      last_card_value!(players_hand, p_card_values)
      player_absolute_total = get_total(p_card_values)
    else
      prompt("You chose to stay.")
      break
    end
    puts " "
    prompt("Current hand's total: #{player_absolute_total}")

    if player_absolute_total > 21
      prompt("Player busts! You LOSE.")
      break
    end
  end

  if player_absolute_total > 21
    prompt("Would you like to play again?")
    y_or_n = play_again
    if y_or_n == 'n'
      prompt("Thanks for playing!")
      break
    else
      prompt("Great! Let's play again.")
      resets_anything(players_hand)
      resets_anything(dealers_hand)
      resets_anything(p_card_values)
      resets_anything(deck)
      deck.merge!(reset_deck)
      next
    end
  end

  prompt("Dealer's turn now.")

  arr_of_ace = ace_counter(dealers_hand)

  if two_aces?(arr_of_ace)
    two_aces_in_initial_hand!(d_card_values)
  elsif one_ace_in_hand?(arr_of_ace)
    default_values!(dealers_hand, d_card_values)
  else
    default_values!(dealers_hand, d_card_values)
  end
  dealer_absolute_total = get_total(d_card_values)

  loop do
    dealer_decision = dealer_hit_or_stay(dealer_absolute_total)
    if dealer_decision == 'h'
      prompt("Dealer hits.")
      add_card_to_hand!(dealers_hand, deck)
      last_card_value!(dealers_hand, d_card_values)
      dealer_absolute_total = get_total(d_card_values)
    elsif dealer_decision == 's'
      prompt("Dealer stays.")
      break
    end
    if dealer_absolute_total > 21
      prompt("Dealer busts! Player wins!!!")
      prompt("Dealers hand: ")
      dealer_shows_hand(dealers_hand)
      break
    end
  end
  puts " "

  if player_decision == 's' && dealer_decision == 's'
    prompt("Both player and dealer chose to stay.")
    prompt("Time to compare player's and dealer's hand...")
    prompt("Dealer unveils their hand:")
    dealer_shows_hand(dealers_hand)
    compare_cards(player_absolute_total, dealer_absolute_total)
  end
  puts " "
  prompt("Would you like to play again?")
  y_or_n = play_again
  if y_or_n == 'n'
    prompt("Thanks for playing!")
    break
  else
    prompt("Great! Let's play again.")
    resets_anything(deck)
    resets_anything(players_hand)
    resets_anything(dealers_hand)
    resets_anything(p_card_values)
    resets_anything(d_card_values)
    deck.merge!(reset_deck)
  end
end
