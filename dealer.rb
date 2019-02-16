require_relative 'player'

class Dealer < Player
  def initialize
    super('Dealer', false)
  end

  def move
    return if points >= 17

    @hand.pull_card(CardDeck.instance.draw_card) unless @hand.full?
  end

  def reset_hand
    @hand = Hand.new(false)
  end
end