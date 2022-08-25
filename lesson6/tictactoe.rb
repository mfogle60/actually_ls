OPTIONS = ['X', 'O']

def display_board(brd)
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

def prompt(msg)
  puts " => #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def player_places_piece!(brd, x_or_o)
  place = " "
  loop do
    place = gets.chomp.to_i
    if place >= 1 && place < 10 && brd[place] == ' '
      break
    else
      prompt("Enter a value between 1-9 and a square without a marker.")
    end
  end
  brd[place] = x_or_o
end

def c_marker(p_marker)
  comp = OPTIONS.select do |move|
    move != p_marker
  end
  comp.join
end

def computer_places_piece!(squares, board, c_move)
  board[squares.sample] = c_move
end

def empty_squares(board)
  board.keys.select { |int| board[int] == ' ' }
end

def winning_combos(board, p_move)
  [
    [board[1] == p_move, board[2] == p_move, board[3] == p_move],
    [board[4] == p_move, board[5] == p_move, board[6] == p_move],
    [board[7] == p_move, board[8] == p_move, board[9] == p_move],
    [board[1] == p_move, board[4] == p_move, board[7] == p_move],
    [board[2] == p_move, board[5] == p_move, board[8] == p_move],
    [board[3] == p_move, board[6] == p_move, board[9] == p_move],
    [board[1] == p_move, board[5] == p_move, board[9] == p_move],
    [board[3] == p_move, board[5] == p_move, board[7] == p_move]
  ]
end

def player_wins?(combos)
  combos.any? do |subarr|
    subarr.all?
  end
end

def computer_wins?(combos)
  combos.any? do |subarr|
    subarr.all? 
  end
end

def play_again
  response = ''
  loop do
    response = gets.chomp.upcase
    if response == 'N' || response == 'Y'
	     break
    else
      prompt("Please enter either \'Y\' or \'N\'.")
    end
  end
  response
end

def empty?(brd)
  brd.values.all? { |i| i != ' ' }
end

def tie?(brd)
  brd.keys.select { |k| brd[k] == ' ' } == []
end

board = initialize_board

prompt("Welcome to Tic-Tac-Toe!")
display_board(board)
prompt("What's your name?")
name = gets.chomp
p_marker = ' '
prompt("Welcome #{name}!")
loop do
  prompt("Would you like to be Xs or Os?")
  loop do
    p_marker = gets.chomp.upcase
    if p_marker == 'X' || p_marker == 'O'
      prompt("Great! You're #{p_marker}'s.")
      break
    else
      prompt("You need to enter either X or O.")
    end
  end

  loop do
    prompt("Available places to make move:(#{empty_squares(board).join(',')})")
    player_places_piece!(board, p_marker)
    display_board(board)
    c_marker(p_marker)
    computer_places_piece!(empty_squares(board), board, c_marker(p_marker))
    prompt("Computer has made its move.")
    display_board(board)
    if player_wins?(winning_combos(board, p_marker))
      prompt("Player wins!")
      break
    elsif computer_wins?(winning_combos(board, c_marker(p_marker)))
      prompt("Computer wins!")
      break
    elsif empty?(board)
      prompt("It's a tie!")
      break
    end
  end
  prompt("Would you like to play again? (Y or N)")
  if play_again == 'N'
    prompt("Thank you for playing!")
    break
  else
    board = initialize_board
  end
end
