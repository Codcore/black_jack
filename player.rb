require_relative 'bank'
require_relative 'hand'

class Player
  attr_reader :name, :hand, :bank

  def initialize(name, visible_hand = true)
    @name = name
    @bank = Bank.new
    @hand = Hand.new(visible_hand)
  end

  def points
    return nil unless @hand.visible

    points = 0
    @hand.cards.each do |card|
      if card.value.is_a?(Array)
        value = (21 - points) >= 11 ? card.value[1] : card.value[0]
        points += value
        next
      end
      points += card.value
    end
    points
  end
end