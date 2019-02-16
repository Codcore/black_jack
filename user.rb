require_relative 'player'

class User < Player
  def initialize(name)
    super(name)
    @hand = Hand.new
  end
end