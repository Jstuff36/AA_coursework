require "colorize"
require_relative "board"
require_relative "cursor"
require "byebug"

class Display
  attr_accessor :board, :cursor
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    # board.board.each_index do |row|
    #   board.board[row].each_index do |col|
    #     if (row + col).even?
    #       print " ".colorize(:color => :light_blue, :background => :red)
    board.board.each_index do |row|
      board.board[row].each_index do |col|
        item = board[[row,col]]
        if [row, col] == cursor.cursor_pos
          print item.sym.colorize(:color => :light_blue, :background => :red)
        else
          print item.sym.colorize(:color => item.color)
        end
      end
      puts "\n"
    end
  end
end
