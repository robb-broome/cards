class Card
  include Comparable
  attr_reader :face, :value

  def initialize(value:, rank:, suit:)
    @value = value
    @face = "#{rank} of #{suit}"
  end

  def <=> other
    value <=> other.value
  end
end
