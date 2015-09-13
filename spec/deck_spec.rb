require_relative 'spec_helper'

describe 'Deck' do

  let(:deck) {Deck.new FrenchDeckRules.new}

  it 'just works' do
    true.must_equal true
  end

  it 'has cards' do
    binding.pry
    deck.cards.must_be_instance_of Array
  end

  it 'has the right number of cards' do
    deck.cards.count.must_equal 52
  end

  it 'draws the first card' do
    initial_cards = deck.cards.dup
    deck.draw.must_equal initial_cards.first
  end

  it 'then draws the second card' do
    initial_cards = deck.cards.dup
    deck.draw
    deck.draw.must_equal initial_cards[1]
  end

  it 'after a draw, there are fewer cards' do
    initial_cards = deck.cards.dup
    deck.draw
    deck.cards.count.must_equal(initial_cards.count - 1)
  end

  it '' do
  end
end
