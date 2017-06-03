class Board

  attr_reader :board

  def initialize(default_size)
    @board = Array.new(default_size) { Array.new(default_size) }
  end

  ALPHABET = ('a'..'z').to_a

  def populate
    card_values = ALPHABET.sample(board.length)

    card_values.each do |value|
      board.length.times do
        pos = [rand(board.length), rand(board.length)]
        until self[pos].nil?
          pos = [rand(board.length), rand(board.length)]
        end
        self[pos] = Card.new(value)
      end

    end
  end

  def render
    temp_board = Array.new(board.length) { Array.new(board.length) }
    board.each_with_index do |row, i|
      row.each_index do |j|
        if self[[i, j]].face_up
          temp_board[i][j] = self[[i, j]].value
        else
          temp_board[i][j] = "?"
        end
      end
    end
    p temp_board
  end

  def won?
    return false if board.flatten.any? { |card| card.face_up == false }
    true
  end

  def reveal(guessed_pos)
    self[guessed_pos].reveal
    self[guessed_pos].value
  end

  def [](pos)
    row, col = pos
    board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    board[row][col] = val
  end

end
