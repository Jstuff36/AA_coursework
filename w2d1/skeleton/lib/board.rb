require 'byebug'

class Board
  attr_accessor :cups

  attr_reader :name1, :name2

  def initialize(name1, name2)
    @cups = place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    arr = Array.new(14) { Array.new(4) {:stone} }
    arr[6] = []
    arr[13] = []
    arr
  end

  def valid_move?(start_pos)
    if start_pos.between?(1,5) || start_pos.between?(7,12)
      true
    else
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []
    i = start_pos
    until stones.empty?
      i += 1
      i = 0 if i > 13
      if current_player_name == name1 && i == 13
        next
      elsif current_player_name == name2 && i == 6
        next
      else
        cups[i] << stones.shift
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
    ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty?} || cups[7..12].all? { |cup| cup.empty?}
  end

  def winner
    return :draw if cups[6] == cups[13]
    if cups[6].length > cups[13].length
      return name1
    else
      return name2
    end
  end
end
