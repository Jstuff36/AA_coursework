require 'rspec'
require 'game'

describe Game do
  let(:board) { double("board", grid: [[1, 2, 3], [], []], render: [[1,2,3],[],[]])}
  subject(:game) { Game.new}

  describe "#initialize" do
    it "initialize game with instance of board" do
      expect(game.board).to be_a Board
    end
  end

end
