require_relative 'player'

class Dealer < Player
  def initialize
    super('Dealer', false)
  end
end