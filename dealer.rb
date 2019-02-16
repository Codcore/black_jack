require_relative 'player'

class Dealer < Player
  def initialize
    super('Dealer')
    @hand = Hand.new(false)
  end
end