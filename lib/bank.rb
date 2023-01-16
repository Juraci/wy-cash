require "money"
require "pair"

class Bank
  attr_reader :rates

  def initialize
    @rates = {}
  end

  def reduce(source:, to:)
    source.reduce(bank: self, to: to)
  end

  def add_rate(from, to, rate)
    @rates.store(Pair.new(from: from, to: to).hash, rate)
  end

  def rate(from:, to:)
    return 1 if from == to
    rates[Pair.new(from: from, to: to).hash]
  end
end
