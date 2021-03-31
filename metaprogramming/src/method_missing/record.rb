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
  end

  def attributes
    @data.keys
  end

  def method_missing(method, *args)
    if attributes.include?(method)
      attributes.each do |attr|
        self.class.define_method attr do
          @data[attr]
        end
      end
      send(method)
    else
      super
    end
  end

  def respond_to?(method)
    attributes.include?(method) || super
  end
end

class Human < Record
end

class Dog < Record
end
