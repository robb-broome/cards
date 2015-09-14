class Hand
  attr_accessor :cards

  def initialize *cards
    @cards = cards.flatten
  end

  def inspect
    cards.map(&:inspect)
  end
end
