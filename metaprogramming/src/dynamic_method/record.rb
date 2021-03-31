class Record
  class << self
    def define_attr(attr)
      define_method attr do
        @data[attr]
      end
    end
  end

  def initialize(data)
    @data = data
    data.keys.each { |k| self.class.define_attr(k) }
  end
end

class Human < Record
end

class Dog < Record
end
