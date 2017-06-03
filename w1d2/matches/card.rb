class Card
  attr_reader :value
  attr_accessor :face_up

  def initialize(value)
    @value = value
    @face_up = false
  end

  def reveal
    self.face_up = true
  end

  def hide
    self.face_up = false
  end

  def ==(other_card)
    return true if self.value == other_card.value
    false
  end

end
