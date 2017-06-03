require_relative 'card'
require_relative 'board'
require_relative 'computer_player'
class Game
  attr_accessor :board, :previous_guess, :player

  def initialize(player)
    @player = player
    @previous_guess = nil
    @board = Board.new
  end

  def play
    until board.won?
      render
      pos = make_valid_guess
      player.receive_revealed_card(pos, board[pos].face_value)
      board.reveal(pos)
      @previous_guess = pos
      render

      pos = make_valid_guess
      until pos != previous_guess
        pos = make_valid_guess
      end
      player.receive_revealed_card(pos, board[pos].face_value)
      board.reveal(pos)

      unless board[previous_guess].face_value == board[pos].face_value
        render
        sleep(2)
        system("clear")
        board[previous_guess].hide
        board[pos].hide
      else
        player.receive_match(pos,previous_guess)
      end


      @previous_guess = nil

    end
    congratulate
  end

  def render
    board.render
  end

  def make_valid_guess
    pos = [nil, nil]
    until valid_guess?(pos)
      player.prompt
      pos = player.get_input(@previous_guess)
    end
    puts "position in valid_guess #{pos}"
    pos
  end


  def valid_guess?(pos)
    row, col = pos
    return false unless row.is_a?(Integer) && row >= 0 && row < board.grid.length
    return false unless col.is_a?(Integer) && col >= 0 && col < board.grid.length
    return false if board.grid[row][col].face_up
    true
  end

  private

  def congratulate
    puts "congratulations! You win!!"
  end

end

game = Game.new(ComputerPlayer.new("jacks"))
game.board.populate
game.play
