class Card
  include Comparable
  attr_reader :face, :value

  def initialize(value:, rank:, suit:)
    @value = value
    @face = "#{rank} of #{suit}"
  end

  def <=> other_card
    value <=> other_card.value
  end
end
