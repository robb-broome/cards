class FrenchRules

  def cards
    @cards ||= suits.product(ranks).map  do |suit, desc|
      Card.new value: desc[0], rank: desc[1], suit: suit
    end
  end

  private

  def face_values
    [2,3,4,5,6,7,8,9,10,'Jack','Queen','King','Ace']
  end

  def suits
    ['Clubs','Spades','Hearts','Diamonds']
  end

  def ranks
    face_values.each_with_index.map {|rank, index| [index, rank]}
  end
end
