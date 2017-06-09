require_relative 'card'

class Deck

  attr_reader :cards

  SUITS = %w(club heart spade diamond)
  VALUES = %w(2 3 4 5 6 7 8 9 10 jack queen king ace)

  def self.populate
    deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        deck << Card.new(value, suit)
      end
    end

    self.new(deck)
  end

  def initialize (cards = [])
    @cards = cards
  end

end
