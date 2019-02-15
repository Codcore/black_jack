class Hand
  attr_reader :cards

  def initialize(cards)
    raise "Hand should be initialized with 2 cards, not #{cards.size}." if cards.size > 2

    @cards = []
    @cards.concat(cards)
  end

  def pull_card(card)
    raise 'Cannot pull cards no more: hand is full.' if full?

    @cards << card
  end

  def full?
    @cards.size == 3
  end
end