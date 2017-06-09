require 'rspec'
require 'deck'

describe Deck do
  let(:deck) {Deck.new}
  describe "#initialize" do
    it 'initializes with empty deck' do
      expect(deck.cards).to be_empty
    end
  end

  describe "Deck#populate" do

    let(:deck1) {Deck.populate}

    it "populates deck with card objects" do
      expect(deck1.cards).to all( be_a(Card))
    end
    it "creates a deck with 52 cards" do
      expect(deck1.cards.length).to eq(52)
    end
    it "expects all cards to be unique" do
      cards = deck1.cards.map do |card|
        [card.value, card.suit]
      end
      expect(cards.uniq).to eq(cards)
    end
  end
end
