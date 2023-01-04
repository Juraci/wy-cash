require "money"

class Franc < Money
  def times(multiplier)
    Money.franc(amount: @amount * multiplier)
  end
end
