class Money
  attr_accessor :amount

  def initialize(amount:)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount: @amount * multiplier)
  end

  def equals?(comparison)
    @amount == comparison.amount
  end
end