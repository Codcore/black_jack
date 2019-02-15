require 'card_deck'

class Hand
  attr_reader :cards

  def initialize
    @deck  = CardDeck.instance
    @cards = @deck.draw_initial_hand
  end

  def pull_card(card)
    raise 'Cannot pull cards no more: hand is full.' if full?

    @cards << card
  end

  def full?
    @cards.size == 3
  end
end