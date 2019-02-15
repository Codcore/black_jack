class Card
  SUITS = {
    spade: '♠',
    club: '♦',
    heart: '♥',
    diamond: '♦'
  }.freeze

  MERITS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  attr_reader :merit, :suit

  def initialize(suit, merit)
    @suit = suit
    raise "Wrong merit '#{merit}. Should be in range #{MERITS}" unless MERITS.include?(merit)

    @merit = merit
  end
end