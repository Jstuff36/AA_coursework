require_relative 'tile'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
  end

  def populate
    bomb_arr = generator
    grid.each_with_index do |row, j|
      row.each_index do |i|
        grid[i][j] = Tile.new(bomb_arr.shift)
      end
    end
  end

  def generator
    generator = Random.new
    bomb_arr = Array.new(81)
    generator.rand(5).times do |i|
      bomb_arr[i] = "B"
    end
    bomb_arr.shuffle
  end

  def render
    puts "  #{(0..8).to_a.join(" ")}"
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(" ")}"
    end
  end

  def game_over?

  end

  def neighbor_check(pos)
    x, y = pos
    (x - 1..x + 1).each do |i|
      (y - 1..y + 1).each do |j|
        next unless (0..8).to_a.include?(x) && (0..8).to_a.include?(y)
        self[[x, y]].bomb_count += 1 if self[[i, j]].bomb
      end
    end
  end

  def iterator

  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    grid[x][y] = val
  end

end
