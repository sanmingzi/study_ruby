def test_method
  puts 'this is test_method'
end

m = self.method :test_method
m.call

class MyClass
  def initialize
    @val = 1
  end

  def my_method
    puts 'this is my_method'
    puts @val
  end
end

obj = MyClass.new
m = obj.method :my_method
puts m.class
puts m.inspect
puts m.class.ancestors.inspect
m.call
# puts m.instance_methods.inspect
puts m.methods.inspect
puts m.receiver.inspect

puts Method.instance_methods(false).inspect


[m].each do |func|
  func.call
end
