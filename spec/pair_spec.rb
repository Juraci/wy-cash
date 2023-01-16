require "spec_helper"
require "pair"

RSpec.describe Pair do
  let(:rates) do
    {}
  end

  it "is hashable" do
    rates.store(Pair.new(from: "USD", to: "BRL").hash, 5)

    expect(rates[Pair.new(from: "USD", to: "BRL").hash]).to eq 5
  end
end