class Hand
  attr_reader :cards

  def initialize(*args)
    raise "Hand should be initialized with 2 cards, not #{args.length}." if args.length > 2

    @cards = []
    @cards.concat(args)
  end

  def pull_card(card)
    raise 'Cannot pull cards no more: hand is full.' if full?

    @cards << card
  end

  def full?
    true if @cards.length == 3
  end
end