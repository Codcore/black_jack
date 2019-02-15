require_relative 'bank'
require_relative 'hand'

class Player
  def initialize(name, cards)
    @bank = Bank.new
    @hand = Hand.new(cards)
  end
end