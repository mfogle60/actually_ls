require 'pry'

# Instead of making hardcoded values and repeating them, we can hardcode constant variables
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt input
  puts "=> #{input}"
end

# here is the actual board itself
def display_board brd
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]} "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end

def initialize_board
  board = {}

  (1..9).each { |brd| board[brd] = INITIAL_MARKER}
   board
end

# **IMPORTANT!**
# Notice that we have our empty_squares method doing two things.
# her it is returning to us all the keys that have an empty value
def empty_squares brd # here it is
  brd.keys.select { |i| brd[i] == INITIAL_MARKER}
end

def player_plays_piece! brd  # aka player_places_piece
  i = ""
  loop do
    i = gets.chomp.to_i
    # And here it is being used for the success logic
    if empty_squares(brd).include?(i)# i >= 1 && i <= 9
      break
    else
      prompt "Please enter a number between 1-9"
    end
  end
  brd[i] = PLAYER_MARKER
end

def computer_places_piece brd, empty
  # comp can enter wherever the user hasnt
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def winner? # there is a winner if there are 
end

board = initialize_board

loop do
  prompt("Squares where you can make a move: #{empty_squares(board).join(',')}")
  display_board board
  player_plays_piece! board
  display_board board
  computer_places_piece(board, empty_squares(board))
  # here we decide if there is a winner or no winner..

end


=begin
prompt "Please enter your move: \'X\' or \'O\'"
marker = ' '
loop do # need a looping construct here because we are asking user for their input
  marker = gets.chomp.upcase
  if marker == 'X' || marker == 'O'
    break
  else
    prompt("Sorry that does not appear to be correct. Enter either \'X\' or \'O\'.")
  end
end
=end
