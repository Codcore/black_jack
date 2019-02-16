require_relative 'card_deck'

class Hand
  attr_reader :cards
  attr_accessor :visible

  def initialize(visible = true)
    @deck    = CardDeck.instance
    @cards   = @deck.draw_initial_hand
    @visible = visible
  end

  def pull_card(card)
    raise 'Cannot pull cards no more: hand is full.' if full?

    @cards << card
  end

  def full?
    @cards.size == 3
  end

  def to_s
    hand_str = ''
    if @visible
      @cards.each { |card| hand_str += card.to_s + ' ' }
      return hand_str
    end

    @cards.size.times { hand_str += '* '}
    hand_str
  end
end