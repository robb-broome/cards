class FrenchDeckRules
  attr_reader :ranks, :suits
  def initialize
    @ranks = [2,3,4,5,6,7,8,9,10,'Jack','Queen','King','Ace']
    @suits = ['Clubs','Spaces','Hearts','Diamonds']
    @cards = suits.product(ranks).map {|desc| Card.new rank: desc[1], suit: desc[0]}
  end
end
