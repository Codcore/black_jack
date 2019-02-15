class Hand
  attr_reader :cards

  def initialize(*args)
    @cards = []
    @cards.concat(args)
  end

  def pull_card(card)
    @cards << card
  end

  def full?
    true if @cards.length == 3
  end
end