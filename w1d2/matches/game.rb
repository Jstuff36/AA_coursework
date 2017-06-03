require_relative "card"
require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game

  attr_reader :game_board, :player

  def initialize(board, player)
    @game_board = board
    @player = player
  end

  def play
    game_board.populate
    until game_board.won?
      game_board.render
      guess_one = player.make_guess
      game_board.reveal(guess_one)

      game_board.render
      guess_two = player.make_guess
      check_cards(guess_one, guess_two)
      sleep(0.1)
      system("clear")
    end
    puts "You won"
    game_board.render
  end

  def check_cards(guess_one, guess_two)
    if game_board[guess_one] == game_board[guess_two]
      puts "MATCH!"
      game_board.reveal(guess_two)
    else
      puts "no match"
      game_board[guess_one].hide
    end
    false
  end


end

if __FILE__ == $PROGRAM_NAME
  DEFAULT_SIZE = 4
  board = Board.new(DEFAULT_SIZE)
  game = Game.new(board, ComputerPlayer.new(board))
  game.play
end
