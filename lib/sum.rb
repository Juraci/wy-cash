require "money"

class Sum
  attr_accessor :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(bank: nil, to:)
    amount = augend.reduce(bank: bank, to: to).amount + addend.reduce(bank: bank, to: to).amount
    Money.new(amount: amount, currency: to)
  end

  def plus(addend)
  end
end
