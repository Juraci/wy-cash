require "sum"
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

  def reduce(bank: nil, to:)
    rate = bank.rate(from: @currency, to: to)
    Money.new(amount: @amount / rate, currency: to)
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def self.dollar(amount:)
    Money.new(amount: amount, currency: "USD")
  end

  def self.franc(amount:)
    Money.new(amount: amount, currency: "CHF")
  end
end
