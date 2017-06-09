require 'rspec'
require 'hand'

describe Hand do
  let(:hand) { Hand.new}
  describe "#initialize" do
    it 'initializes hand as empty' do
      expect(hand.cards).to be_empty
    end
  end
end 
