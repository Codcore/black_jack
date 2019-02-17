require_relative 'user'
require_relative 'dealer'
require_relative 'bank'
require_relative 'card_deck'
require_relative 'black_jack'

class Game
  include BlackJack
  attr_reader :user, :dealer, :bank, :card_deck

  def initialize(user_name)
    @user = User.new(user_name)
    @dealer = Dealer.new
    @bank = Bank.new(0)
    @card_deck = CardDeck.instance.refresh
  end

  def determine_winner
    return if @dealer.points == @user.points
    return if (@dealer.points > BLACK_JACK) && (@user.points > BLACK_JACK)

    @dealer if @user.points > BLACK_JACK
    @user if @dealer.points > BLACK_JACK

    BLACK_JACK - @user.points < BLACK_JACK - @dealer.points ? @user : @dealer
  end
end
