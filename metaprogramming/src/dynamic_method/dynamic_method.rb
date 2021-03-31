# ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]

require_relative 'record'

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
