OPTIONS = %w(X O)
BOARD = [[1, 2, 3]] + [[4, 5, 6]] +[[7, 8, 9]] +
    [[1, 4, 7]] +[[2, 5, 8]] +[[3, 6, 9]] +
    [[1, 5, 9]] + [[3, 5, 7]]

P_C = %w(P C)

require 'pry'
require 'pry-byebug'

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

def computer_move_piece_randomly!(board, c_move)
  square = board.keys.sample
  until board[square] == ' '
    square = board.keys.sample
  end
    board[square] = c_move
end

def computer_win?(board, c_move)
  BOARD.any? do |subarr|
    subarr.all? { |i| board[i] == c_move}
  end
end

def say_win_one_game(i)
  i == 'P' ? prompt("Player wins!") : prompt("Computer wins!")
end

def player_win?(board, p_move)
  BOARD.any? do |subarr|
    subarr.all? { |i| board[i] == p_move}
  end
end

def empty_squares(board)
  board.keys.select { |int| board[int] == ' ' }
end

def empty?(brd)
  brd.values.all? { |i| i != ' ' }
end

def tie?(brd)
  brd.keys.select { |k| brd[k] == ' ' } == []
end

def joinor(empty, punc = ' ', and_or = 'or')
  empty.map!(&:to_s)

  if empty.size > 1
    counter = 0
    loop do
      empty[counter] += punc
      counter += 1
      break if counter == empty.size - 1
    end
    empty.insert(-2, and_or)
  end
  empty.join(" ")
end

def player_won_five(p)
  if p == 5
    prompt("Player wins!! GAME OVER.")
  end
end

def computer_won_five(c)
  if c == 5
    prompt("Computer wins!! GAME OVER.")
  end
end

def clear_board(board)
  board.each do |k, v|
    board[k] = ' '
  end
end

def detect_threat(board, player_move)
  BOARD.select do |subarr|
    if subarr.count { |i| board[i] == player_move } == 2 && subarr.count { |s| board[s] == ' '} == 1
      return subarr
    end
  end
end

def defend_intelligently!(board, arr, comp_move)
  arr.each do |i|
    if board[i] == ' '
      board[i] = comp_move
    end
  end
end

def detect_where_to_attack(comp_move, board)
  BOARD.select do |subarr|
    if subarr.count { |i| board[i] == comp_move } == 2 && subarr.count { |s| board[s] == ' '} == 1
      return subarr
    end
  end
end

def attack_intelligently!(arr, board, comp_move)
  arr.each do |i|
    if board[i] == ' '
      board[i] = comp_move
    end
  end
end

def comp_into_square_5(board, comp_move)
  board[5] = comp_move
end

def first_move(move)
  move
end

def after_first_move(move)
  move
end

def choose_x_or_o
  move = ' '
  loop do
    move = gets.chomp.upcase
    if move == 'X' || move == 'O'
      break
    else
      prompt("You need to enter either X or O.")
    end
  end
  move
end

def won_five(i)
  r = ''
  if i == 5
    prompt("GAME OVER!")
    prompt("Would you like to play again?")
    prompt("Enter either \'N\' or \'Y\'.")
    loop do
      r = gets.chomp.upcase
      if r == 'Y' || r == 'N'
        break
      else
        puts "Please enter either \'N\' or \'Y\'."
      end
    end
  end
  r
end

# Add a `who goes first' method that lets the computer decide who goes first.
def who_goes_first
  P_C.sample
end

computers_move = OPTIONS.sample
board = initialize_board
p_win_count = 0
c_win_count = 0
goes_first = ' '
y_or_n = ' '



prompt("Welcome to Tic-Tac-Toe.First player to 5 wins wins the game.")

loop do
  prompt("The computer will decide who goes first.\'P\' (you) or \'C\'(computer)")
  goes_first = who_goes_first
  prompt("Computer decided..#{goes_first} will go first!")
  if goes_first == 'P'
    prompt("Would you like to be X or O?")
    players_move = choose_x_or_o
    computers_move = OPTIONS.select { |i| i != players_move }.join

    player_first = first_move(players_move)
    prompt("Player chose #{player_first}, computer is #{computers_move}")

    loop do
      prompt("Where would you like to place your move?")
      prompt("The available squares are: #{joinor(empty_squares(board), ',')}")
      display_board(board)
      player_places_piece!(board, player_first)

      if player_win?(board, player_first)
        say_win_one_game(player_first)
        p_win_count += 1
        prompt("Games won by player so far: #{p_win_count}")
        y_or_n = won_five(p_win_count)
        if y_or_n == 'Y'
          prompt("Great! Let's play again, shall we?")
          clear_board(board)
          p_win_count = 0
          c_win_count = 0
          break
        elsif won_five(p_win_count) == 'N'
          break
        end
        clear_board(board)
        break
      end

    if tie?(board)
      prompt("It's a tie!")
      clear_board(board)
      break
    end

      display_board(board)
      prompt("Computer's turn.")
      prompt("Square(s) available to make a move in:")
      prompt("#{joinor(empty_squares(board), ',')}")

      computer_second = after_first_move(computers_move)

      attack_ai = detect_where_to_attack(computer_second, board)
      defense_ai = detect_threat(board, player_first)

      if !(attack_ai.empty?)
        attack_intelligently!(attack_ai, board, computer_second)
      elsif !(defense_ai.empty?)
        defend_intelligently!(board, defense_ai, computer_second)
      else
        if board[5] == ' '
          comp_into_square_5(board, computer_second)
        else
          computer_move_piece_randomly!(board, computer_second)
        end
      end

      display_board(board)

      if tie?(board)
        prompt("It's a tie!")
        clear_board(board)
        break
      end

      if computer_win?(board, computer_second)
        prompt("Computer wins!")
        c_win_count += 1
        prompt("Games won by computer so far: #{c_win_count}")
        y_or_n = won_five(c_win_count)
        if y_or_n == 'Y'
          prompt("Great! Let's play again, shall we?")
          clear_board(board)
          p_win_count = 0
          c_win_count = 0
          break
        elsif won_five(p_win_count) == 'N'
          break
        end
        clear_board(board)
        break
      end
    end


    if tie?(board)
      prompt("It's a tie!")
      clear_board(board)
      break
    end

  elsif goes_first == 'C'
      prompt("Computer goes first")
      players_move = OPTIONS.select { |i| i != computers_move }.join
      player_second = after_first_move(players_move)
      prompt("Computer chose: #{computers_move}, player is: #{players_move}.")

      loop do
        prompt("Computers move: #{computers_move}, players move: #{players_move}.")
        prompt("The computer can choose to make a move in the following squares:")
        prompt(joinor(empty_squares(board), ','))
        computer_first = first_move(computers_move)

        attack_ai = detect_where_to_attack(computer_first, board)
        defense_ai = detect_threat(board, player_second)

        if !(attack_ai.empty?)
          attack_intelligently!(attack_ai, board, computer_first)
        elsif !(defense_ai.empty?)
          defend_intelligently!(board, defense_ai, computer_first)
        else
          if board[5] == ' '
            comp_into_square_5(board, computer_first)
          else
            computer_move_piece_randomly!(board, computer_first)
          end
        end

        display_board(board)

        if computer_win?(board, computer_first)
          prompt("Computer wins!")
          c_win_count += 1
          prompt("Games won by computer so far: #{c_win_count}")
          y_or_n = won_five(c_win_count)
          if y_or_n == 'Y'
            prompt("Great! Let's play again, shall we?")
            clear_board(board)
            p_win_count = 0
            c_win_count = 0
            break
          elsif won_five(p_win_count) == 'N'
            break
          end
          clear_board(board)
          break
        end

      if tie?(board)
        prompt("It's a tie!")
        clear_board(board)
        break
      end

        prompt("Player's turn.")
        prompt("Where would you like to make a move?")
        prompt("The available squares are: #{joinor(empty_squares(board), ',')}")
        player_places_piece!(board, player_second)

        display_board(board)

        if player_win?(board, players_move)
          prompt("Player wins!")
          player_win_count += 1
          prompt("Games won by computer so far: #{c_win_count}")
          clear_board(board)
          y_or_n = won_five(c_win_count)
          if y_or_n == 'Y'
            prompt("Great! Let's play again, shall we?")
            clear_board(board)
            p_win_count = 0
            c_win_count = 0
            break
          elsif won_five(p_win_count) == 'N'
            break
          end
          clear_board(board)
          break
        end

        if tie?(board)
          prompt("It's a tie!")
          clear_board(board)
          break
        end

      end
    end

  if y_or_n == 'N'
    prompt("Thank you for playing!")
    break
  end
end
