require_relative 'bank'
require_relative 'hand'

class Player
  attr_reader :name, :hand, :bank
  def initialize(name)
    @name = name
    @bank = Bank.new
    @hand = Hand.new
  end
end