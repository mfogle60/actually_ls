require 'yaml'

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

def generate_random_hand!(deck_copy)
  cards = []
  2.times do
    suit = deck_copy.keys.shuffle.sample
    values = deck_copy[suit].shuffle.sample
    cards << [suit, values]
  end
  cards
end

def verifies_and_deals_unique_cards!(deck)
  hand = generate_random_hand!(deck)
  hand.uniq!
  loop do
    if hand.size == 2
      return hand
    else
      hand.clear
      hand = generate_random_hand!(deck)
      hand.uniq!
    end
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

def say_dealer_hand(d_hand)
  prompt("Dealer has: ")
  suit = d_hand[0][0]
  puts("#{d_hand[0][1]} of #{suit} #{choose_icon_for_suit(suit)}")
  puts("unknown card")
end

def says_both_hands(p_hand, d_hand)
  say_player_hand(p_hand)
  prints_blank_lines
  say_dealer_hand(d_hand)
  prints_blank_lines
end

def says_both_hands_but_reveal_d(p_hand, d_hand)
  say_player_hand(p_hand)
  prints_blank_lines
  says_all_of_dealers_hand(d_hand)
  prints_blank_lines
end

def says_all_of_dealers_hand(hand)
  prompt("Dealer's entire hand: ")
  hand.each do |subarr|
    puts "#{subarr[1]} of #{subarr[0]}"
  end
end

def says_different_hand_options(choice, p_hand, d_hand)
  case choice
  when "player"
    say_player_hand(p_hand)
  when "dealer initial"
    say_dealer_hand(d_hand)
  when "both initial"
    says_both_hands(p_hand, d_hand)
  when "both reveal d"
    says_both_hands_but_reveal_d(p_hand, d_hand)
  end
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

def h_or_s # so here..
  input = gets.chomp.downcase
  loop do
    break if input == 'h' || input == 's'
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

def player_hit_or_stay(decision, p_hand, deck, p_values)
  case decision
  when :h
    message_after_hitting
    sleep_and_clear_game
    effects_of_hit!(p_hand, deck, p_values)
    sleep_and_clear_game
  else
    message_after_staying
  end
end

def message_after_hitting
  prompt(display_message(MESSAGES_TO_DISPLAY, 'player_hits'))
end

def message_after_staying
  prompt(display_message(MESSAGES_TO_DISPLAY, 'player_stays'))
end

def bust?(total)
  total > 21
end

def dealer_decides_move(sum)
  sum < 17 ? :h : :s
end

def says_dealer_hits_or_stays(decision)
  case decision
  when :h
    prompt(display_message(MESSAGES_TO_DISPLAY, 'dealer_hits'))
  else
    prompt(display_message(MESSAGES_TO_DISPLAY, 'dealer_stays'))
  end
end

def play_again
  y_or_n = ''
  puts("Enter \'y\' or \'n\'.")
  loop do
    y_or_n = gets.chomp.downcase
    return y_or_n.to_sym if y_or_n == 'n' || y_or_n == 'y'
    prompt(display_message(MESSAGES_TO_DISPLAY, 'n_or_y'))
  end
end

def says_continue_game_or_not(decision)
  case decision
  when :y
    prompt(display_message(MESSAGES_TO_DISPLAY, 'continue_game'))
  else
    prompt(display_message(MESSAGES_TO_DISPLAY, 'goodbye'))
  end
end

def compare_hands(player, dealer, p_hand, d_hand)
  if player > dealer
    prompt(display_message(MESSAGES_TO_DISPLAY, 'players_hand_wins'))
  elsif player == dealer
    prompt(display_message(MESSAGES_TO_DISPLAY, 'tie'))
  else
    prompt(display_message(MESSAGES_TO_DISPLAY, 'dealers_hand_wins'))
  end

  says_different_hand_options('both reveal d', p_hand, d_hand)
end

def clears_everything!(*args)
  args.map!(&:clear)
end

def flow_of_dealers_turn(hand, values, deck)
  prompt(display_message(MESSAGES_TO_DISPLAY, 'dealer_turn'))
  sleep_and_clear_game
  loop do
    total = values.inject(:+)
    decision = dealer_decides_move(total)
    says_dealer_hits_or_stays(decision)
    sleep_and_clear_game
    return decision if decision == :s
    effects_of_hit!(hand, deck, values)
    total = values.inject(:+)
    return :bust if bust?(total)
  end
end

def dealer_stayed_or_busted(action, p_hand, d_hand, p_values, d_values)
  p_total = p_values.inject(:+)
  d_total = d_values.inject(:+)

  case action
  when :s
    prompt("Time to compare cards!...")
    sleep_and_clear_game
    compare_hands(p_total, d_total, p_hand, d_hand)
  else
    prompt("Dealer busted!! Player won!")
    prints_blank_lines
    says_different_hand_options('both reveal d', p_hand, d_hand)
  end
end

def flow_to_continue_playing
  prompt(display_message(MESSAGES_TO_DISPLAY, 'play_again'))
  y_or_n = play_again
  sleep_and_clear_game
  y_or_n
end

deck = deck_of_cards

p_card_values = []
d_card_values = []

players_hand = ''
dealers_hand = ''
player_decision = ''
player_total = ''
dealer_total = ''

# introduction_flow

loop do
  players_hand = verifies_and_deals_unique_cards!(deck)
  delete_initial_cards_from_hand!(players_hand, deck)
  says_different_hand_options('player', players_hand, dealers_hand)
  player_total = sum_of_hand(players_hand, p_card_values)
  prints_blank_lines
  dealers_hand = verifies_and_deals_unique_cards!(deck)
  delete_initial_cards_from_hand!(dealers_hand, deck)
  says_different_hand_options('dealer initial', players_hand, dealers_hand)
  dealer_total = sum_of_hand(dealers_hand, d_card_values)
  prints_blank_lines
  prompt("Press #{flashes_message('enter')} to continue.")
  sleep_and_clear_game if hit_enter

  loop do
    says_different_hand_options('both initial', players_hand, dealers_hand)
    prompt(display_message(MESSAGES_TO_DISPLAY, 'h_or_s'))
    puts("(Your hand's total is: #{flashes_message(player_total)}.)")
    puts " "
    player_decision = h_or_s
    sleep_and_clear_game
    player_hit_or_stay(player_decision, players_hand, deck,
                       p_card_values)
    player_total = p_card_values.inject(:+)

    break if player_decision == :s || bust?(player_total)
  end

  sleep_and_clear_game

  if bust?(player_total)
    prompt(display_message(MESSAGES_TO_DISPLAY, 'player_busts'))
    prints_blank_lines
    says_different_hand_options('both reveal d', players_hand, dealers_hand)
    y_or_n = play_again
    sleep_and_clear_game
    if y_or_n == :y
      clears_everything!(players_hand, dealers_hand,
                         p_card_values, d_card_values)
      deck = deck_of_cards
      next
    end
    break
  end

  outcome_of_dealer_move = flow_of_dealers_turn(dealers_hand, # method I refactored
                                                d_card_values, deck)

  dealer_stayed_or_busted(outcome_of_dealer_move, players_hand,
                          dealers_hand, p_card_values, d_card_values)
  prints_blank_lines

  y_or_n = flow_to_continue_playing # 2nd method I refactored

  if y_or_n == :y
    says_continue_game_or_not(y_or_n)
    clears_everything!(dealers_hand, players_hand,
                       p_card_values, d_card_values)
    deck = deck_of_cards
  else
    prompt(display_message(MESSAGES_TO_DISPLAY, 'goodbye'))
    break
  end

  break if y_or_n == :n
end
