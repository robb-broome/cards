class Card
  attr_accessor :rank, :suite
  def initialize opts
    @rank = opts[:rank]
    @suit = opts[:suit]
  end

  def name
    "#{rank} of #{suit}"
  end

  def inspect
    name
  end
end
