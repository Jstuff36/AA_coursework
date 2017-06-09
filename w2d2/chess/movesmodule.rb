require 'byebug'

module SlidingPiece

  def ordinal_dir_moves(pos, board)
    row, col = pos
    result = []

    downindex = 1

    while (row + downindex).between?(0, 7)
      unless board[[row + downindex, col]].is_a?(NullPiece)
        if self.color == board[[row + downindex, col]].color
          break
        else
          result << [row + downindex, col]
          break
        end
      end
      result << [row + downindex, col]
      downindex += 1
    end

    upindex = 1

    while (row - upindex).between?(0, 7)
      unless board[[row - upindex, col]].is_a?(NullPiece)
        if self.color == board[[row - upindex, col]].color
          break
        else
          result << [row - upindex, col]
          break
        end
      end
      result << [row - upindex, col]
      upindex += 1
    end

    leftindex = 1

    while (col - leftindex).between?(0, 7)
      unless board[[row, col - leftindex]].is_a?(NullPiece)
        if self.color == board[[row, col - leftindex]].color
          break
        else
          result << [row, col - leftindex]
          break
        end
      end
      result << [row, col - leftindex]
      upindex += 1
    end

    rightindex = 1

    while (col + rightindex).between?(0, 7)
      unless board[[row,col + rightindex]].is_a?(NullPiece)
        if self.color == board[[row, col + rightindex]].color
          break
        else
          result << [row, col + rightindex]
          break
        end
      end
      result << [row, col + rightindex]
      upindex += 1
    end

    result
  end

  def diagonal_dir_moves(pos, board)
    row, col = pos
    result = []

    row_incre = 1
    col_incre = 1

    while (col + col_incre).between?(0,7) && (row + row_incre).between?(0,7)
      new_row = row + row_incre
      new_col = col + col_incre
      unless board[[new_row, new_col]].is_a?(NullPiece)
        if self.color == board[[new_row, new_col]].color
          break
        else
          result << [new_row,new_col]
          break
        end
      end
      result << [new_row, new_col]
      row_incre += 1
      col_incre += 1
    end

    row_incre = 1
    col_incre = 1

    while (col - col_incre).between?(0,7) && (row - row_incre).between?(0,7)
      new_row = row - row_incre
      new_col = col - col_incre
      unless board[[new_row, new_col]].is_a?(NullPiece)
        if self.color == board[[new_row,new_col]].color
          break
        else
          result << [new_row,new_col]
          break
        end
      end
      result << [new_row, new_col]
      row_incre += 1
      col_incre += 1
    end

    row_incre = 1
    col_incre = 1

    while (col + col_incre).between?(0,7) && (row - row_incre).between?(0,7)
      new_col = col + col_incre
      new_row = row - row_incre
      unless board[[new_row, new_col]].is_a?(NullPiece)
        if self.color == board[[new_row, new_col]].color
          break
        else
          result << [new_row,new_col]
          break
        end
      end
      result << [new_row, new_col]
      row_incre += 1
      col_incre += 1
    end

    row_incre = 1
    col_incre = 1

    while (col - col_incre).between?(0,7) && (row + row_incre).between?(0,7)
      new_col = col - col_incre
      new_row = row + row_incre
      unless board[[new_row, new_col]].is_a?(NullPiece)
        if self.color == board[[new_row, new_col]].color
          break
        else
          result << [new_row,new_col]
          break
        end
      end
      result << [new_row, new_col]
      row_incre += 1
      col_incre += 1
    end

    result
  end

end

module SteppingPiece

  KINGS_MOVES = [[1,1], [1,0], [1,-1], [0,-1], [-1,-1], [-1, 0], [-1,1], [0,1]]
  KNIGHTS_MOVES = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1],[-1,2]]

  def kings_moves(pos, board)
    result = []
    KINGS_MOVES.each do |move|
      row, col = pos[0] + move[0], pos[1] + move[1]
      if row.between?(0,7) && col.between?(0,7) && (board[[row,col]].is_a?(NullPiece) || self.color != board[[row, col]].color)
        result << [row,col]
      end
    end
    result
  end

  def knights_moves(pos, board)
    result = []
    KNIGHTS_MOVES.each do |move|
      row, col = pos[0] + move[0], pos[1] + move[1]
      if row.between?(0,7) && col.between?(0,7) && (board[[row, col]].is_a?(NullPiece) || self.color != board[[row, col]].color)
        result << [row,col]
      end
    end
    result
  end

end
