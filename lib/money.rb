class Money
  attr_accessor :amount, :currency

  def initialize(amount:, currency:)
    @amount = amount
    @currency = currency
  end

  def equals?(comparison)
    @amount == comparison.amount &&
      @currency == comparison.currency
  end

  def times(multiplier)
    Money.new(amount: @amount * multiplier, currency: currency)
  end

  def self.dollar(amount:)
    Money.new(amount: amount, currency: "USD")
  end

  def self.franc(amount:)
    Money.new(amount: amount, currency: "CHF")
  end
end
