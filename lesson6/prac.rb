require 'pry'
require 'pry-byebug'

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' '}
  new_board
end

board = initialize_board

board.keys.each { |k| board[k] == 'X' }

def detect_winner brd
  combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  combinations.each do |line|
    binding.pry
    if brd[line[0]] == 'X' && brd[line[1]] == 'X' && brd[line[2]] == 'X'
      return 'Player wins'
    end
    binding.pry
  end

end

detect_winner board
