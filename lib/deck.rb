class Deck
  attr_reader :deck_type, :cards

  def initialize rules
    @deck_type = rules
    @cards = rules.cards.dup
  end

  def draw
    cards.shift
  end
end
