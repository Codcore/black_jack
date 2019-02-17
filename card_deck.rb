require_relative 'card'
require 'singleton'

class CardDeck
  include Singleton

  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.keys.each do |suit|
      Card::MERITS.each { |merit| @cards << Card.new(suit, merit) }
    end
    shuffle
  end

  def shuffle
    @cards.shuffle!
  end

  def refresh
    initialize
    self
  end

  def draw_card
    raise 'Cannot draw card: card deck is empty.' if @cards.empty?

    @cards.pop
  end

  def draw_initial_hand
    cards = []
    2.times { cards << draw_card }
    cards
  end

  def empty?
    @cards.empty?
  end
end
