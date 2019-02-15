require_relative 'card'

class CardDeck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.keys.each do |suit|
      Card::MERITS.each { |merit| @cards << Card.new(suit, merit) }
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def draw_card
    @cards.pop
  end
end