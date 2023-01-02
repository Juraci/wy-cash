require "spec_helper"
require "dollar"

RSpec.describe "Integration specs" do
  it "multiplies a given amount" do
    five = Dollar.new(amount: 5)
    product = five.times(2)

    expect(product.amount).to eq 10

    product_b = five.times(3)
    expect(product_b.amount).to eq 15
  end

  describe "#Dollar.equals" do
    it "returns true when the amount is the same" do
      five = Dollar.new(amount: 5)

      expect(five).to be_equals(Dollar.new(amount: 5))
    end

    it "returns false when the amount is different" do
      five = Dollar.new(amount: 5)

      expect(five).to_not be_equals(Dollar.new(amount: 6))
    end
  end
end