require_relative 'board'

class Game
  attr_reader :board
  def initialize
    @board = Board.new
  end

  def play
    until board.won?
      board.render
      begin
      puts "Where would you like to move from?"
      from_pos = gets.chomp.to_i
      puts "Where would you like to move to?"
      to_pos = gets.chomp.to_i
      board.move(from_pos, to_pos)
    rescue StandardError => e
      puts e.message
      retry
    end

    end
    board.render
    puts "You won"
  end

end

Game.new.play
