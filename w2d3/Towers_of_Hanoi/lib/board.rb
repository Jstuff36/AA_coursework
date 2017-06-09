class Board

  attr_accessor :grid

  def initialize
    @grid = [[1,2,3], [], []]
  end

  def move(from_pos, new_pos)
    if valid_move?(from_pos, new_pos)
      disk = grid[from_pos].shift
      grid[new_pos].unshift(disk)
    end
  end

  def won?
    return true if grid[0].empty? && (grid[1].empty? || grid[2].empty?)
    false
  end
  def valid_move?(from_pos, new_pos)

      if grid[from_pos].empty?
        raise "can't move disk from empty stack"
      elsif grid[new_pos].empty?
        true
      elsif grid[from_pos].first > grid[new_pos].first
        raise "can't move larger disk onto smaller one"
      else
        true
      end
  end

  def render
    p grid
  end

end
