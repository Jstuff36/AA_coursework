class ComputerPlayer

  attr_reader :known_cards, :game_board

  def initialize(name = "Mac", board)
    @name = name
    @known_cards = {}
    @game_board = board
  end

  def make_guess

    known_cards.each do |val, pos|
      if known_cards[val].length > 1

      end

    end

    if known_cards.empty?
      guess = [rand(game_board.board.length), rand(game_board.board.length)]
      update_known_cards(guess)
    end
    guess
  end

  def update_known_cards(guess)
    known_cards[guess] = game_board[guess].value
  end

end
