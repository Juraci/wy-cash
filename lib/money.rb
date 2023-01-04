class Money
  attr_accessor :amount, :currency

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end

  def equals?(comparison)
    @amount == comparison.amount &&
      self.class == comparison.class
  end

  def self.dollar(amount:)
    Dollar.new(amount: amount, currency: "USD")
  end

  def self.franc(amount:)
    Franc.new(amount: amount, currency: "CHF")
  end
end
