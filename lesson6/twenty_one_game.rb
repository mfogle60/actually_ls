require 'yaml'
require 'pry'

MESSAGES_TO_DISPLAY = YAML.load_file("twenty_one.yml")

FILES = ["twenty_one.txt", "general_info.txt",
         "rules_for_twenty_one.txt", "values_of_cards.txt"]

SUITS = [:diamonds, :spades, :hearts, :clubs]

SUIT_AND_ICON = { diamonds: '◆', hearts: '♥', clubs: '♣', spades: '♠' }

J_K_Q = %w(Jack King Queen)

def display_message(file, message)
  file[message]
end

def flashes_message(msg)
  "\e[5m#{msg}\e[0m"
end

def deck_of_cards
  { diamonds: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King),
    hearts: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King),
    clubs: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King),
    spades: %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King) }
end

def prompt(message)
  puts "=> #{message}"
end

def prints_blank_lines
  3.times { puts ' ' }
end

def hit_enter
  e = gets.chomp
  loop do
    break if e == ''
    prompt(display_message(MESSAGES_TO_DISPLAY, 'enter_again'))
    e = gets.chomp
  end
  e
end

def introduction_flow
  counter = 0
  loop do
    puts File.readlines(FILES[counter])
    prints_blank_lines
    prompt("Please press the #{flashes_message('enter')} key to continue.")
    hit_enter
    sleep_and_clear_game
    counter += 1
    break if counter == 3
  end
end

def sleep_and_clear_game
  sleep 2
  system('clear')
end

def initialize_hand!(hand, deck)
  initial_two_cards!(hand, deck)
  delete_initial_cards_from_hand!(hand, deck)
end

def delete_initial_cards_from_hand!(hand, deck)
  hand.each do |subarr|
    subarr.each_index do |_|
      deck[subarr[0]].delete_if { |item| item == subarr[1] }
    end
  end
end

def delete_drawn_card_from_deck!(hand, deck)
  suit = hand[-1][0]
  card = hand[-1][1]
  deck[suit].delete_if { |c| c == card }
end

def add_card_to_hand!(hand, deck)
  suit = SUITS.sample
  card = deck[suit].sample
  hand << [suit, card]
end

def generate_random_hand(deck_copy)
  suit = SUITS.sample
  suits_value = deck_copy[suit].sample
  [suit, suits_value]
end

def initial_two_cards!(hand, deck)
  while hand.size < 2
    hand << generate_random_hand(deck)
  end
end

def arr_of_values_but_no_suits!(hand, values)
  hand.each do |subarr|
    values << subarr[1]
  end
end

def choose_icon_for_suit(suit)
  case suit
  when :hearts
    SUIT_AND_ICON[:hearts]
  when :diamonds
    SUIT_AND_ICON[:diamonds]
  when :clubs
    SUIT_AND_ICON[:clubs]
  else
    SUIT_AND_ICON[:spades]
  end
end

def say_player_hand(hand)
  prompt("Your hand is: ")
  hand.each do |subarr|
    zero_index = subarr[0]
    puts("#{subarr[1]} of #{zero_index} #{choose_icon_for_suit(zero_index)}")
  end
end

def says_both_hands(p_hand, d_hand)
  prompt("Your hand is: ")
  p_hand.each do |subarr|
    zero_index = subarr[0]
    puts("#{subarr[1]} of #{zero_index} #{choose_icon_for_suit(zero_index)}")
  end

  prints_blank_lines

  prompt("Dealer has: ")
  suit = d_hand[0][0]
  puts("#{d_hand[0][1]} of #{suit} #{choose_icon_for_suit(suit)}")
  puts("unknown card")
  prints_blank_lines
end

def say_dealer_hand(d_hand)
  prompt("Dealer has: ")
  suit = d_hand[0][0]
  puts("#{d_hand[0][1]} of #{suit} #{choose_icon_for_suit(suit)}")
  puts("unknown card")
end

def convert_to_ten_or_face_value!(values)
  values.map! do |card|
    if J_K_Q.member?(card)
      10
    else
      card.to_i
    end
  end
end

def one_ace_in_initial_hand!(values)
  values.map! do |card|
    if card == 'Ace'
      11
    else
      card
    end
  end
  convert_to_ten_or_face_value!(values)
end

def two_aces_in_initial_hand!(values)
  values.clear
  loop do
    values << 11
    values << 1
    break
  end
end

def string_values_to_integers(values)
  if values.count('Ace') == 2
    two_aces_in_initial_hand!(values)
  elsif values.count('Ace') == 1
    one_ace_in_initial_hand!(values)
  else
    convert_to_ten_or_face_value!(values)
  end
end

def sum_of_hand(hand, values)
  arr_of_values_but_no_suits!(hand, values)
  string_values_to_integers(values)
  values.inject(:+)
end

def determine_last_card_value!(hand, arr)
  arr << if J_K_Q.member?(hand.last[1])
           10
         elsif hand.last[1] == 'Ace'
           arr.inject(:+) + 11 > 21 ? 1 : 11
         else
           hand.last[1].to_i
         end
end

def h_or_s
  input = gets.chomp.downcase
  loop do
    break if input == 'stay' || input == 'hit'
    prompt(display_message(MESSAGES_TO_DISPLAY, 'h_or_s'))
    input = gets.chomp.downcase
  end
  input.to_sym
end

def effects_of_hit!(hand, deck, values)
  add_card_to_hand!(hand, deck)
  delete_drawn_card_from_deck!(hand, deck)
  determine_last_card_value!(hand, values)
end

def message_after_hitting
  prompt(display_message(MESSAGES_TO_DISPLAY, 'player_hits'))
end

def message_after_staying
  prompt("Player stays")
end

def bust?(total)
  total > 21
end

def dealer_decides_move(sum)
  sum < 17 ? :hit : :stay
end

def says_dealer_hits_or_stays(decision)
  case decision
  when :hit
    prompt(display_message(MESSAGES_TO_DISPLAY, 'dealer_hits'))
  else
    prompt(display_message(MESSAGES_TO_DISPLAY, 'dealer_stays'))
  end
end

def play_again
  y_or_n = ''
  puts("Enter \'yes\' or \'no\'.")
  loop do
    y_or_n = gets.chomp.downcase
    return y_or_n.to_sym if y_or_n == 'no' || y_or_n == 'yes'
    prompt(display_message(MESSAGES_TO_DISPLAY, 'n_or_y'))
  end
end

def says_continue_game_or_not(decision)
  case decision
  when :yes
    prompt(display_message(MESSAGES_TO_DISPLAY, 'continue_game'))
  else
    prompt(display_message(MESSAGES_TO_DISPLAY, 'goodbye'))
  end
end

def did_player_and_dealer_stay?(p_move, d_move)
  p_move == :stay && d_move == :stay
end

def says_all_of_dealers_hand(hand)
  prompt("Player's entire hand: ")
  hand.each do |subarr|
    puts "#{subarr[1]} of #{subarr[0]}"
  end
end

def compare_hands(player, dealer, hand)
  if player > dealer
    prompt(display_message(MESSAGES_TO_DISPLAY, 'players_hand_wins'))
  elsif player == dealer
    prompt(display_message(MESSAGES_TO_DISPLAY, 'tie'))
  else
    prompt(display_message(MESSAGES_TO_DISPLAY, 'dealers_hand_wins'))
  end
  prints_blank_lines
  says_all_of_dealers_hand(hand)
end

def clears_everything!(*args)
  args.map!(&:clear)
end

deck = deck_of_cards

players_hand = []
dealers_hand = []
p_card_values = []
d_card_values = []

player_decision = ''
dealer_decision = ''
player_total = ''
dealer_total = ''

introduction_flow

loop do
  initialize_hand!(players_hand, deck)
  say_player_hand(players_hand)
  player_total = sum_of_hand(players_hand, p_card_values)
  prints_blank_lines
  initialize_hand!(dealers_hand, deck)
  say_dealer_hand(dealers_hand)
  dealer_total = sum_of_hand(dealers_hand, d_card_values)
  prints_blank_lines
  prompt("Press #{flashes_message('enter')} to continue.")
  sleep_and_clear_game if hit_enter

  loop do
    prompt(display_message(MESSAGES_TO_DISPLAY, 'h_or_s'))
    puts("(Your hand's total is: #{flashes_message(player_total)}.)")
    puts " "
    player_decision = h_or_s
    sleep_and_clear_game

    case player_decision
    when :hit
      message_after_hitting
      sleep_and_clear_game
      effects_of_hit!(players_hand, deck, p_card_values)
      player_total = p_card_values.inject(:+)
      says_both_hands(players_hand, dealers_hand)
    else
      message_after_staying(player_total)
    end
    prints_blank_lines
    break if player_decision == :stay || bust?(player_total)
  end

  sleep_and_clear_game

  if bust?(player_total)
    prompt(display_message(MESSAGES_TO_DISPLAY, 'player_busts'))
    puts("(You lost because your total was: #{player_total})")
    y_or_n = play_again
    sleep_and_clear_game
    if y_or_n == :yes
      clears_everything!(players_hand, dealers_hand,
                         p_card_values, d_card_values)
      deck = deck_of_cards
      next
    end
    break
  end

  prompt(display_message(MESSAGES_TO_DISPLAY, 'dealer_turn'))
  sleep_and_clear_game

  loop do
    dealer_total = d_card_values.inject(:+)
    dealer_decision = dealer_decides_move(dealer_total)
    says_dealer_hits_or_stays(dealer_decision)
    sleep_and_clear_game
    if dealer_decision == :hit
      effects_of_hit!(dealers_hand, deck, d_card_values)
    end
    dealer_total = d_card_values.inject(:+)
    break if dealer_decision == :stay || bust?(dealer_total)
  end

  sleep_and_clear_game

  if bust?(dealer_total)
    prompt(display_message(MESSAGES_TO_DISPLAY, 'dealer_busts'))
  elsif did_player_and_dealer_stay?(player_decision, dealer_decision)
    prompt(display_message(MESSAGES_TO_DISPLAY, 'both_stay'))
    compare_hands(player_total, dealer_total, dealers_hand)
  end

  prints_blank_lines

  loop do
    prompt(display_message(MESSAGES_TO_DISPLAY, 'play_again'))
    y_or_n = play_again
    sleep_and_clear_game
    says_continue_game_or_not(y_or_n)
    if y_or_n == :yes
      clears_everything!(dealers_hand, players_hand,
                         p_card_values, d_card_values)
      deck = deck_of_cards
    end
    break
  end

  break if y_or_n == :no
end
