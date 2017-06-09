require "singleton"
require_relative "movesmodule"

class Piece

  attr_reader :pos, :board, :sym, :color

  def initialize(pos, board, color)
    @color = color
    @sym = nil
    @pos = pos
    @board = board
  end

  def moves
    []
  end

  def valid_moves

  end

end

class Queen < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
    @sym = "♕"
  end


  def moves
    ordinal_dir_moves(pos, board) + diagonal_dir_moves(pos, board)
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
    @sym = "♖"
  end

  def moves
    ordinal_dir_moves(pos, board)
  end

end

class Bishop < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super
    @sym = "♗"
  end

  def moves
    diagonal_dir_moves(pos, board)
  end
end

class Knight < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super
    @sym = "♘"
  end

  def moves
    knights_moves(pos, board)
  end
end

class King < Piece
  include SteppingPiece

  def initialize(pos, board, color)
    super
    @sym = "♔"
  end

  def moves
    kings_moves(pos, board)
  end
end

class Pawn < Piece
  attr_reader :forward_dir
  def initialize(pos, board, color)
    @forward_dir = pos[0] == 1 ? 1 : -1
    super
    @sym = "♙"
  end

  def moves
    result = []
    row, col = pos
    new_row = row + forward_dir

    if (new_row).between?(0, 7) && board[[new_row,col]].is_a?(NullPiece)
      result << [new_row, col]
    end


    [-1,1].each do |col_move|
      new_col = col + col_move
      if (new_row).between?(0, 7) && (new_col).between?(0,7)
        if !board[[new_row, new_col]].is_a?(NullPiece) && self.color != board[[new_row,new_col]].color
          result << [new_row, new_col]
        end
      end
    end
    result
  end
end

class NullPiece < Piece
  include Singleton

  attr_reader :sym

  def initialize
    @sym = " "
  end

end
