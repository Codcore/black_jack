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
    points = 0
    aces_arr = []
    @cards.each do |card|
      if card.value.is_a?(Array)
        aces_arr << card.value
        next
      end
      points += card.value
    end
    unless aces_arr.empty?
      aces_arr.each do |aces_values|
        ace_value = (BLACK_JACK - points) >= 11 ? aces_values[1] : aces_values[0]
        points += ace_value
      end
    end
    points
  end

  def full?
    @cards.size == 3
  end

  def to_s
    return @cards.join(' ') if visible

    @cards.map { '*' }.join(' ')
  end
end
