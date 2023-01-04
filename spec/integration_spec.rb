require "spec_helper"
require "dollar"
require "franc"

RSpec.describe "Integration specs" do
  it "multiplies a given amount" do
    five = Dollar.new(amount: 5)

    expect(five.times(2)).to be_equals(Dollar.new(amount: 10))
    expect(five.times(3)).to be_equals(Dollar.new(amount: 15))
  end

  it "multiplies a given amount" do
    five = Franc.new(amount: 5)

    expect(five.times(2)).to be_equals(Franc.new(amount: 10))
    expect(five.times(3)).to be_equals(Franc.new(amount: 15))
  end

  describe ".equals" do
    it "returns true when the amount is the same" do
      five = Dollar.new(amount: 5)

      expect(five).to be_equals(Dollar.new(amount: 5))
    end

    it "returns false when the amount is different" do
      five = Dollar.new(amount: 5)

      expect(five).to_not be_equals(Dollar.new(amount: 6))
    end

    it "returns false when comparing two different currencies" do
      expect(Dollar.new(amount: 5)).to_not be_equals(Franc.new(amount: 5))
    end
  end
end
