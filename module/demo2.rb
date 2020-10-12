module Test
  C = 10
end
	
class Person1
  extend Test

  class << self
    def method1
      puts self.inspect
      puts self.ancestors.inspect
      puts Module.nesting.inspect
      puts C
    end
  end
end
	
Person1.method1
puts "Person1.constants: #{Person1.constants}"
puts "Person1.singleton_class.constants: #{Person1.singleton_class.constants}"