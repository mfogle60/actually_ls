
FILES = ["twenty_one.txt", "general_info.txt",
         "rules_for_twenty_one.txt", "values_of_cards.txt"]

SUITS = [:diamonds, :spades, :hearts, :clubs]

SUIT_AND_ICON = {diamonds: '◆', hearts: '♥', clubs: '♣', spades: '♠'}

J_K_Q = %w(Jack King Queen)

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
  prompt("Please press the \'enter\' key to continue")
  e = gets.chomp
  loop do
    break if e == ''
    prompt("You didn't press the \'enter\' key.")
    prompt("Please press it to continue.")
    e = gets.chomp
  end
  e
end

def sleep_and_clear_instructions
  sleep 2
  system('clear')
end

def flow
  counter = 0
  loop do
    puts File.readlines(FILES[counter])
    prints_blank_lines
    hit_enter
    sleep_and_clear_instructions
    counter += 1
    break if counter == 3
  end
end

def empty_arr
  var = []
end

def sleep_and_clear_game
  sleep 3
  system('clear')
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

def show_hand(hand)
  hand.each do |subarr|
    zero_index = subarr[0]
    puts("#{subarr[1]} of #{zero_index} #{choose_icon_for_suit(zero_index)}")
  end
end

def say_initial_cards_d_has(d_hand)
  suit = d_hand[0][0]
  puts ("#{d_hand[0][1]} of #{suit} #{choose_icon_for_suit(suit)}")
  puts ("unknown card")
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
    arr << if J_K_Q.member?(subarr[1]) # =>subarr = [:spades, 'King']
             10
           elsif subarr.member?('Ace')
             11
           else
             subarr[1].to_i
           end
  end
end

def last_card_value!(hand, arr)
  arr << if J_K_Q.member?(hand.last[1])
           10
         elsif hand.last[1] == 'Ace'
           (arr.inject(:+) + 11) > 21 ? 1 : 11
         else
           hand.last[1].to_i
         end
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
  d_sum > 17 ? 's' : 'h'
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

deck = deck_of_cards

players_hand = generate_hands
dealers_hand = generate_hands
p_card_values = hand_values
d_card_values = hand_values

player_absolute_total = ''
dealer_absolute_total = ''

player_decision = ''
dealer_decision = ''

flow

loop do
  prompt("Your hand is: ")
  initial_hand!(deck, players_hand)
  puts " "
  show_hand(players_hand)
  arr_of_ace = ace_counter(players_hand)
  puts " "
  if two_aces?(arr_of_ace)
    two_aces_in_initial_hand!(p_card_values)
  else
    default_values!(players_hand, p_card_values)
  end

  player_absolute_total = get_total(p_card_values)
  prompt("Initial total of hand: #{player_absolute_total}")
  sleep_and_clear_game

  prompt("Dealer has: ")
  initial_hand!(deck, dealers_hand)
  say_initial_cards_d_has(dealers_hand)
  sleep_and_clear_game

  loop do
    puts "Your current hand is: "
    show_hand(players_hand)
    prints_blank_lines
    puts "Dealer's current hand is: "
    say_initial_cards_d_has(dealers_hand)
    prints_blank_lines
    prompt("Would you like to hit or stay?")
    prompt("Enter \'h\' or \'s\'.")
    player_decision = h_or_s
    if player_decision == 'h'
      add_card_to_hand!(players_hand, deck)
      last_card_value!(players_hand, p_card_values)
      player_absolute_total = get_total(p_card_values)
      sleep_and_clear_game
    else
      prompt("You chose to stay.")
      sleep_and_clear_game
      break
    end

    prompt("Current hand's total: #{player_absolute_total}")
    sleep_and_clear_game

    if player_absolute_total > 21
      prompt("Player busts! You LOSE!!!")
      sleep_and_clear_game
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
      players_hand = empty_arr
      dealers_hand = empty_arr
      p_card_values = empty_arr
      d_card_values = empty_arr
      deck = deck_of_cards
      sleep_and_clear_game
      next
    end
  end

  prompt("Dealer's turn now...")
  sleep_and_clear_game

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
      prompt("Dealer decides to hit.")
      sleep_and_clear_game
      add_card_to_hand!(dealers_hand, deck)
      last_card_value!(dealers_hand, d_card_values)
      dealer_absolute_total = get_total(d_card_values)
    elsif dealer_decision == 's'
      prompt("Dealer decides to stay.")
      sleep_and_clear_game
      break
    end
    if dealer_absolute_total > 21
      prompt("Dealer busts! Player wins!!!")
      prompt("Dealers hand: ")
      show_hand(dealers_hand)
      sleep_and_clear_game
      break
    end
  end

  if player_decision == 's' && dealer_decision == 's'
    prompt("Both player and dealer chose to stay.")
    sleep_and_clear_game
    prompt("Time to compare player's and dealer's hand...")
    prompt("Dealer unveils their hand:")
    show_hand(dealers_hand)
    compare_cards(player_absolute_total, dealer_absolute_total)
    sleep_and_clear_game
  end

  prompt("Would you like to play again?")
  y_or_n = play_again
  if y_or_n == 'n'
    prompt("Thanks for playing!")
    break
  else
    prompt("Great! Let's play again.")
    players_hand = empty_arr
    dealers_hand = empty_arr
    p_card_values = empty_arr
    d_card_values = empty_arr
    deck = deck_of_cards
    sleep_and_clear_game
  end
end
