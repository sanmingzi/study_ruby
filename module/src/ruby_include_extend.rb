module ConstantA
  A = 'A'
end

module ConstantB
  B = 'B'
end

class Person
  include ConstantA
end

puts Person.constants.inspect # [:A]
puts Person.singleton_class.constants.inspect # []

class Person
  extend ConstantB
end

puts Person.constants.inspect # [:A]
puts Person.singleton_class.constants.inspect # [:B]

class Person
  puts self.inspect # Person
  puts self.ancestors.inspect
  # [Person, ConstantA, Object, Kernel, BasicObject]

  def self.say
    begin
      puts A
      puts B
    rescue => exception
      puts exception.inspect
    end
  end
end

Person.say
# A
# <NameError: uninitialized constant Person::B>

class << Person
  puts self.inspect # #<Class:Person>
  puts self.ancestors.inspect
  # [#<Class:Person>, ConstantB, #<Class:Object>, #<Class:BasicObject>, Class, Module, Object, Kernel, BasicObject]

  def say
    begin
      puts B
      puts A
    rescue => exception
      puts exception.inspect
    end
  end
end

Person.say
# B
# <NameError: uninitialized constant #<Class:Person>::A>
