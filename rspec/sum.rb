class Sum
  class << self
    def calculate(left, right)
      (left..right).to_a.inject(0) { |rtn, val| rtn + val }
    end
  end
end
