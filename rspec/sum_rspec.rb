require './sum'

RSpec.describe Sum do
  describe "#calculate" do
    it "returns 1 for sum(0, 1)" do
      rtn = Sum.calculate(0, 1)
      expect(rtn).to eq(1)
    end

    it "returns 55 for sum(0, 10" do
      rtn = Sum.calculate(0, 10)
      expect(rtn).to eq(55)
    end
  end
end
