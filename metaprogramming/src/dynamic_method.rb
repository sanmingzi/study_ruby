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

human_data = {
  id: 1,
  name: 'Windmill',
  age: 18
}
human = Human.new(human_data)
puts "Human.instance_methods: #{Human.instance_methods(false).inspect}"
[:id, :name, :age].each { |attr| puts "#{attr} is: #{human.send(attr)}" }

dog_data = {
  id: 1,
  name: 'wangcai',
  age: 1,
  voice: 'wangwang'
}
dog = Dog.new(dog_data)
puts "Dog.instance_methods: #{Dog.instance_methods(false).inspect}"
[:id, :name, :age, :voice].each { |attr| puts "#{attr} is: #{dog.send(attr)}" }
