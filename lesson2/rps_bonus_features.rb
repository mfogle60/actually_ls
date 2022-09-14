def print_prompt(message)
  puts "=> #{message}"
end

def possibilities
  { 'rock': ['lizard', 'scissors'], }
    'scissors': ['paper', 'lizard'],
    'paper': ['rock', 'spock'],
    'spock': ['rock', 'scissors'],
    'lizard': ['spock', 'paper']
end

def print_we_win(first, second)
  possibilities.include?(first.to_sym) && possibilities[first.to_sym].include?(second)
end

def print_comp_win(f, s)
  possibilities.include?(f.to_sym) && possibilities[f.to_sym].include?(s)
end

def print_we_tie(fi, se)
  possibilities[fi.to_sym] == possibilities[se.to_sym]
end

def moves_hash
  {
    'r': 'rock',
    'p': 'paper',
    'sc': 'scissors',
    'sp': 'spock',
    'l': 'lizard'
  }
end

def moves_hash_value!(place)
  moves_hash[turn_to_sym!(place)]
end


def turn_to_sym!(input)
  input.to_sym
end


def yes_or_no(input)
  ['y', 'Y', 'n', "N"].include?(input)
end

our_wins = 0
comp_wins = 0

VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

print_prompt("Welcome to #{VALID_CHOICES.join(', ')}!")

loop do
  print_prompt("Select your move:")
  print_prompt("Enter \'r\' for rock, \'p\' for paper, \'sc\' for scissors,
  \'sp\' for spock and \'l\' for lizard.")

  our_choice = gets.chomp

  loop do
    if moves_hash.has_key?(turn_to_sym!(our_choice))
      break
    else
      print_prompt("Sorry, your move #{our_choice} is not valid.")
      print_prompt("Try again.")
      our_choice = gets.chomp
    end
  end

  computer_choice = VALID_CHOICES.sample

  print_prompt("You chose: #{moves_hash_value!(our_choice)} and the computer chose #{computer_choice}.")

  if print_we_win(moves_hash_value!(our_choice), computer_choice)
    print_prompt("You win!")
    our_wins += 1
  elsif print_comp_win(computer_choice, moves_hash_value!(our_choice))
    print_prompt("Computer wins!")
    comp_wins += 1
  elsif print_we_tie(moves_hash_value!(our_choice), computer_choice)
    print_prompt("It\'s a tie!")
  end

  if our_wins == 3
    print_prompt("You are the grand winner!")
    break
  elsif comp_wins == 3
    print_prompt("Game over! The grand winner is the computer!")
    break
  end

  # make this simpler
  print_prompt('Would you like to play again? Y or N')
  play_again = gets.chomp.downcase
  loop do
    if yes_or_no(play_again)
      if play_again == 'y'
        print_prompt("The game will continue!")
        break
      elsif play_again == 'n'
        break
      end
    else
      print_prompt("Sorry you need to enter only either Y or N.")
      play_again = gets.chomp
    end
  end

  break if play_again == 'n'

end

print_prompt('Thanks for playing!')
