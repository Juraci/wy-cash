require "money"
class Dollar < Money
  def times(multiplier)
    Money.dollar(amount: @amount * multiplier)
  end
end