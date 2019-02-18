require_relative 'card'
require_relative 'card_deck'
require_relative 'black_jack'

class Hand
  include BlackJack

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

  def points
    result = @cards.sum(&:value)
    ace_correction(result)
  end

  def full?
    @cards.size == 3
  end

  def to_s
    return @cards.join(' ') if visible

    @cards.map { '*' }.join(' ')
  end

  private

  def ace_correction(points)
    @cards.each do |card|
      points -= Card::ACE_CORRECTION if card.ace? && points > BLACK_JACK
    end
    points
  end
end
