require_relative "piece"

class Board

  attr_accessor :board

  def initialize(board = Array.new(8) { Array.new(8) {nil} })
    @board = board
  end

  PIECES = [
  "Rook",
  "Knight",
  "Bishop",
  "King",
  "Queen",
  "Bishop",
  "Knight",
  "Rook"
]

  def populate

    board[1].each_index {|i| board[1][i] = Pawn.new([1, i], self, :white)}
    board[6].each_index {|i| board[6][i] = Pawn.new([6, i], self, :black)}

    nullpiece = NullPiece.instance

    (2..5).each do |row|
      board[row].each_index { |col| board[row][col] = nullpiece}
    end

    board[0].each_index do |col|
      board[0][col] = Object.const_get(PIECES[col]).new([0, col], self, :white)
    end

    board[7].each_index do |col|
      board[7][col] = Object.const_get(PIECES.reverse[col]).new([7, col], self, :black)
    end
  end

  def move_piece(start_pos, end_pos)
    raise StandardError if self[start_pos].nil?
    raise StandardError if self[end_pos]
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def iterate_board(&prc)
    arr = []
    board.each_index do |row|
      board[row].each_index do |col|
        arr << [row,col] if prc.call(board[row][col])
      end
    end
    arr
  end

  def kings_pos(color)
    iterate_board {|piece| piece.color == color && piece.is_a?(King)}
  end

  def in_check?(color)
    king_pos = kings_pos(color)
    possible_checks = iterate_board do |curr_piece|
      curr_piece.moves.include? king_pos
    end
    return true if possible_checks.length > 0
    false
  end

  def checkmate?(color)
    return false unless in_check?(color)
    our_pieces = iterate_board {|piece| piece.color == color && piece.valid_moves.length > 0}
    return true if our_pieces.empty?
    false
  end

  def [](pos)
    x,y = pos
    board[x][y]
  end

  def []=(pos, val)
    x, y = pos
    board[x][y] = val
  end

  def in_bounds?(pos)
    pos.all? { |i| i.between?(0, 7) }
  end
end
