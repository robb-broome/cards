require_relative 'spec_helper'

describe 'Deck' do

  let(:deck) {Deck.new FrenchRules.new}

  it 'has an array of cards' do
    deck.cards.must_be_instance_of Array
  end

  it 'has cards' do
    deck.cards.first.must_be_instance_of Card
  end

  it 'has the right number of cards' do
    deck.cards.count.must_equal 52
  end

  it 'draws the first card' do
    initial_cards = deck.cards.dup
    deck.draw.inspect.must_equal [initial_cards.first.face]
  end

  it 'then draws the second card' do
    initial_cards = deck.cards.dup
    deck.draw
    deck.draw.inspect.must_equal [initial_cards[1].face]
  end

  it 'returns a card name when it draws' do
    deck.draw.inspect.must_equal ['2 of Clubs']
  end

  it 'draws two cards' do
    deck.draw(2).inspect.must_be_instance_of Array
  end

  it 'after a draw, there are fewer cards' do
    initial_cards = deck.cards.dup
    deck.draw
    deck.cards.count.must_equal(initial_cards.count - 1)
  end

  it 'cuts equally' do
    initial_count = deck.cards.count
    deck.cut.each do |cut_deck|
      cut_deck.cards.count.must_equal initial_count / 2
    end
  end

  it 'cuts into two decks' do
    deck.cut.each do |cut_deck|
      cut_deck.must_be_instance_of Deck
    end
  end

  it 'shuffle returns a deck' do
    deck.shuffle.must_be_instance_of Deck
  end

  it 'shuffles the deck' do
    original_cards = deck.cards.dup
    shuffled_cards = deck.shuffle.cards.dup
    # well, there is a chance they could equal. But you'd have to run this a few times.
    original_cards.wont_equal shuffled_cards
  end

end

describe Card do

  describe 'comparable cards' do
    let(:high_club) {Card.new rank: '10', suit: 'Clubs', value: 10}
    let(:high_heart) {Card.new rank: '10', suit: 'Hearts', value: 10}
    let(:low_club) {Card.new rank: '2', suit: 'Clubs', value: 2}

    specify 'a high card outranks a low card' do
      assert low_club < high_club
    end

    specify 'a low card under-ranks a high card' do
      assert high_club > low_club
    end

    specify 'suits do not affect the value' do
      assert high_heart == high_club
    end

    specify 'equal cards are equal' do
      assert high_heart <= high_club
    end

    specify 'inequalities with equals' do
      assert high_heart >= high_club
    end

    specify 'less_than_or_equal' do
      assert low_club <= high_club
    end

    specify 'greater_than_or_equal' do
      assert high_heart >= low_club
    end
  end

end
