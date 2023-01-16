require "spec_helper"
require "bank"
require "money"

RSpec.describe "Integration specs" do
  it 'multiplies a given amount in dollar' do
    five = Money.dollar(amount: 5)

    expect(five.times(2)).to be_equals(Money.dollar(amount: 10))
    expect(five.times(3)).to be_equals(Money.dollar(amount: 15))
  end

  it 'multiplies a given amount in franc' do
    five = Money.franc(amount: 5)

    expect(five.times(2)).to be_equals(Money.franc(amount: 10))
    expect(five.times(3)).to be_equals(Money.franc(amount: 15))
  end

  it 'operations return expressions' do
    five = Money.dollar(amount: 5)
    result = five.plus(five)

    expect(five).to be_equals(result.augend)
    expect(five).to be_equals(result.addend)
  end

  it 'reduces the sum of same currencies to the correct value' do
    sum = Sum.new(Money.dollar(amount: 3), Money.dollar(amount: 4))
    bank = Bank.new
    result =  bank.reduce(source: sum, to: "USD")
    expect(Money.dollar(amount: 7)).to be_equals(result)
  end

  it 'reduces money' do
    bank = Bank.new
    result = bank.reduce(source: Money.dollar(amount: 1), to: "USD")
    expect(result).to be_equals(Money.dollar(amount: 1))
  end

  it 'reduces money to a different currency' do
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(source: Money.franc(amount: 2), to: 'USD')

    expect(result).to be_equals(Money.dollar(amount: 1))
  end
  
  it 'returns true when the amount is the same' do
    five = Money.dollar(amount: 5)

    expect(five).to be_equals(Money.dollar(amount: 5))
  end

  it 'returns false when the amount is different' do
    five = Money.dollar(amount: 5)

    expect(five).to_not be_equals(Money.dollar(amount: 6))
  end

  it 'returns false when comparing two different currencies' do
    expect(Money.dollar(amount: 5)).to_not be_equals(Money.franc(amount: 5))
  end

  it 'returns its currency' do
    expect(Money.dollar(amount: 1).currency).to eq 'USD'
    expect(Money.franc(amount: 1).currency).to eq 'CHF'
  end
end
