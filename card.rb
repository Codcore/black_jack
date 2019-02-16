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
    raise "Wrong suit '#{suit}'for card. Should be in range #{SUITS.values}." unless SUITS.include?(suit)

    @suit = suit
    raise "Wrong merit '#{merit}' for card. Should be in range #{MERITS}." unless MERITS.include?(merit)

    @merit = merit
  end

  def value
    value = @merit.to_i
    return [1, 11] if @merit == 'A'

    return 10 if value.zero?

    value
  end

  def to_s
    "#{SUITS[suit]}#{merit}"
  end
end