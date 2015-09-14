class Deck

  extend Forwardable
  def_delegator :@rules, :cards

  def initialize rules
    @rules = rules
  end

  def draw hits=1
    Hand.new cards.shift(hits)
  end

  def cut
    card_count = cards.count
    half = (card_count/2.0).ceil
    slices = cards.each_slice(half)
    slices.map do |slice|
      Deck.new(ArbitraryRules.new slice)
    end
  end

  def shuffle
    Deck.new(ArbitraryRules.new cards.shuffle)
  end
end
