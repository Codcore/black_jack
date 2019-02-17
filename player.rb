require_relative 'bank'
require_relative 'hand'

class Player
  attr_reader :name, :hand, :bank

  def initialize(name, visible_hand = true)
    @name = name
    @bank = Bank.new
    @hand = Hand.new(visible_hand)
  end

  def reset_hand
    @hand = Hand.new
  end

  def points
    @hand.points
  end

  def show_points
    return nil unless @hand.visible

    points.to_s
  end
end
