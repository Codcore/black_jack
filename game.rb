require_relative 'user'
require_relative 'dealer'
require_relative 'bank'
require_relative 'card_deck'

class Game
  def initialize(user_name)
    @user      = User.new(user_name)
    @dealer    = Dealer.new
    @bank      = Bank.new
    @card_deck = CardDeck.instance
  end
end