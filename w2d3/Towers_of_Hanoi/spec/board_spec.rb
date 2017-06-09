require 'rspec'
require 'board'

describe Board do
  subject(:board) {Board.new}
  describe "#initialize" do
    it 'initialize board with a stack of disks' do
      expect(board.grid).to eq([[1,2,3], [], []])
    end
  end

  describe "#move" do
    it 'makes a move with user input' do
      board.move(0, 1)
      expect(board.grid).to eq([[2,3], [1], []])
    end
  end

  describe "#won?" do
    it "checks if game is won" do
      board.grid = [[], [1,2,3], []]
      expect(board.won?).to be true
    end
  end

  describe "#valid_move?" do
    before(:each) do
      board.grid = [[2,3],[1],[]]
    end
    it "raise error if try tomove larger disk onto smaller one" do
      expect { board.valid_move?(0,1) }.to raise_error("can't move larger disk onto smaller one")
    end

    it "raise error if try and move disk from an empty stack" do
      expect { board.valid_move?(2,1) }.to raise_error("can't move disk from empty stack")
    end

  end


end
