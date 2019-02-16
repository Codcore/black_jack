class Bank
  attr_reader :funds

  def initialize(amount = 100)
    @funds = amount
  end

  def bet(amount = 10)
    raise 'Not enough funds in the bank to make a bet.' if (@funds - amount) < 0

    @funds -= amount
    amount
  end

  def receive(amount)
    @funds += amount
  end

  def empty?
    @funds.zero?
  end

  def to_s
    @funds.to_s
  end

  def give_cash
    cash = @funds
    @funds = 0
    cash
  end
end