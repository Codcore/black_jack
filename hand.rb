class Hand
  attr_reader :cards

  def initialize(*args)
    @cards = []
    @cards.concat(args)
  end

  def pull_card(card)
    @cards << card
  end
end