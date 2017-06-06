require_relative 'board'
require 'byebug'

class Minesweeper

  def self.populate_board
    board = Board.new
    board.populate
    self.new(board)
  end

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def run
    play

  end

  def play

    until board.game_over?
      p "Make a guess in the form of f or r,pos1,pos2"
      user_input = gets.chomp
      move, *pos = parse_input(user_input)
      if move == "f"
        board[pos].flag = true
      elsif guessed_bomb(pos)
        puts "You lost"
        break
      else
        check_guess(pos)
      end
      board.grid.each {|row| p row}
    end

  end

  def parse_input(user_input)

    user_input.split(",").map do |el|
      if ["f", "r"].include? el
        el
      else
        el.to_i
      end
    end
  end


  def check_guess(pos)
    board.neighbor_check(pos)
    if board[pos].bomb_count > 0
      board[pos].revealed = true
    else
      x, y = pos
      (x - 1..x + 1).each do |i|
        (y - 1..y + 1).each do |j|
          next unless (0..8).to_a.include?(x) && (0..8).to_a.include?(y)
          check_guess([i,j]) unless [i,j] == pos
        end
      end
    end

  end

  def guessed_bomb(guess)
    board[guess].bomb
  end

end

game = Minesweeper.populate_board
game.run
