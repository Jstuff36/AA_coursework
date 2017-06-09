require "rspec"
require "card"

describe Card do
  describe "#initialize" do
    subject(:card) { Card.new("2", :heart)}

    it 'initializes with value of the card' do
      expect(card.value).to eq("2")
    end

    it 'it initializes suit of the card' do
      expect(card.suit).to eq(:heart)
    end
  end 
end
