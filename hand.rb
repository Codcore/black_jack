class Hand
  attr_reader :cards

  def initialize(*args)
    raise "Hand should be initialized with 2 cards, not #{args.size}." if args.size > 2

    @cards = []
    @cards.concat(args)
  end

  def pull_card(card)
    raise 'Cannot pull cards no more: hand is full.' if full?

    @cards << card
  end

  def full?
    @cards.size == 3
  end
end