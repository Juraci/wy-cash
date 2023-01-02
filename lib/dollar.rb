class Dollar
  attr_accessor :amount

  def initialize(amount:)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(amount: @amount * multiplier)
  end

  def equals?(comparison)
    @amount == comparison.amount
  end
end