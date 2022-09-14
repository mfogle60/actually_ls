
VALID_CHOICES = %w(rock paper scissors)
def test_method
  prompt('Test message')
end
# test_method

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You win!')
  elsif win?(computer, player)
    prompt('Computer wins!')
  else
    prompt('It is a tie!')
  end
end

def prompt(message)
  puts "=> #{message}"
end

test_method # first worked

prompt("Welcome to #{VALID_CHOICES.join(',' )} game!")
loop do
  choice = ' '
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp # say we enter paper
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Something is wrong. Try again.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  # => computer_choice = "rock"

  prompt("You chose: #{choice}, computer chose: #{computer_choice}")
  # => "You chose paper, computer chose: rock"

  display_results(choice, computer_choice)

  prompt("Would you like to continue playing?(Enter Y or N)")
  end_game = gets.chomp

  loop do # lets refactor this
    if end_game == 'N'
      break
    elsif end_game == 'Y'
      prompt("You selected #{end_game}, the game will continue.")
      break
    else
      if end_game.empty?
        prompt('You need to enter a correct value. Try again.')
        prompt('Please enter Y or N.')
      elsif end_game != 'N'
        prompt('You need to enter a correct value. Try again.')
        prompt('Please enter Y or N.')
      else
        if end_game != 'Y'
        prompt('You need to enter a correct value. Try again.')
        prompt('Please enter Y or N.')
      end
        end_game = gets.chomp
    end
  end

  break if end_game == 'N'
end

puts 'Thank you for playing!'
