require_relative 'board'

class Tile

  attr_accessor :flag, :revealed, :bomb, :bomb_count

  def initialize(bomb)
    @bomb = bomb
    @flag = false
    @revealed = false
    @bomb_count = 0
  end

  def flag?
    flag
  end

  def revealed?
    revealed
  end

end
