require_relative 'card'

class CardDeck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::MERITS.each { |merit| @cards << Card.new(suit, merit) }
    end
  end
end