class Hand

  VALUES = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "jack" => 11,
    "queen" => 12,
    "king" => 13,
    "ace" => 14
  }

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def royal_flush
    if straight_flush
      return cards if @cards.map(&:value).min == "10"
    end

    false 
  end

  def straight_flush
    return cards if straight && flush
    false
  end

  def four_of_a_kind
    x_of_a_kind(4)
  end

  def full_house
    return cards if three_of_a_kind && (Hand.new(@cards - three_of_a_kind).one_pair)
    false
  end

  def flush
    return cards if cards.map{ |card| card.suit}.uniq.length == 1
  end

  def straight
    lower_straight = [2, 3, 4, 5, 14]
    upper_straight = [10, 11, 12, 13, 14]

    if cards.any? { |card| VALUES[card.value] == 14 }
      return cards if cards.all? { |card| lower_straight.include? VALUES[card.value]}
      return cards if cards.all? { |card| upper_straight.include? VALUES[card.value]}
      false
    else
      cards_sorted = cards.sort { |card| VALUES[card.value] }
      if cards_sorted.last.value - cards_sorted.firt.value == 4
        return cards_sorted
      else
        return false
      end
    end

  end

  def three_of_a_kind
    x_of_a_kind(3)
  end
  def two_pair
    if (first = one_pair) && (second = Hand.new(cards - one_pair).one_pair)
      return first + second
    else
      return false
    end
  end

  def one_pair
    x_of_a_kind(2)
  end

  def high_card
    cards.sort { |card| VALUES[card.value] }.last
  end

  def x_of_a_kind(number)
    VALUES.keys.each do |val|
      num_cards = cards.select {|card| val == card.value }
      return num_cards if num_cards.length == number
    end
    false
  end

end
