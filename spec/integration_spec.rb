require "spec_helper"
require "dollar"
require "franc"

RSpec.describe "Integration specs" do
  it "multiplies a given amount" do
    five = Money.dollar(amount: 5)

    expect(five.times(2)).to be_equals(Money.dollar(amount: 10))
    expect(five.times(3)).to be_equals(Money.dollar(amount: 15))
  end

  it "multiplies a given amount" do
    five = Money.franc(amount: 5)

    expect(five.times(2)).to be_equals(Money.franc(amount: 10))
    expect(five.times(3)).to be_equals(Money.franc(amount: 15))
  end

  describe "Money.equals" do
    it "returns true when the amount is the same" do
      five = Money.dollar(amount: 5)

      expect(five).to be_equals(Money.dollar(amount: 5))
    end

    it "returns false when the amount is different" do
      five = Money.dollar(amount: 5)

      expect(five).to_not be_equals(Money.dollar(amount: 6))
    end

    it "returns false when comparing two different currencies" do
      expect(Money.dollar(amount: 5)).to_not be_equals(Money.franc(amount: 5))
    end
  end
end
