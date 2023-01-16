require "money"

class Sum
  attr_accessor :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(bank: nil, to:)
    amount = augend.amount + addend.amount
    Money.new(amount: amount, currency: to)
  end
end
