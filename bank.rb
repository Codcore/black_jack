class Bank
  def initialize(amount = 100)
    @funds = amount
  end

  def bet(amount = 10)
    raise 'Not enough funds in the bank to make a bet.' if (@funds - amount) < 0

    @funds -= amount
  end

  def empty?
    @funds.zero?
  end
end