class Money
  attr_accessor :amount

  def initialize(amount:)
    @amount = amount
  end

  def times(multiplier)
    self.class.new(amount: @amount * multiplier)
  end

  def equals?(comparison)
    @amount == comparison.amount &&
      self.class == comparison.class
  end

  def self.dollar(amount:)
    Dollar.new(amount: amount)
  end

  def self.franc(amount:)
    Franc.new(amount: amount)
  end
end
