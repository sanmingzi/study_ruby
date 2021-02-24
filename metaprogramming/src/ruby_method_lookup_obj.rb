class Developer
end

d = Developer.new

puts d.class.ancestors.inspect
# [Developer, Object, Kernel, BasicObject]

puts d.singleton_class.ancestors.inspect
# [#<Class:#<Developer:0x0000561c708e4a80>>, Developer, Object, Kernel, BasicObject]

class BasicObject
  def work
    puts 'work in class BasicObject'
  end
end
d.work

puts Kernel.class
# Module
Kernel.class_eval do
  def work
    puts 'Kernel.class_eval def work'
  end
end
d.work
# Kernel.class_eval def work

class Object
  def work
    puts 'work in class Object'
  end
end
d.work
# work in class Object

class Developer
  def work
    puts 'work in class Developer'
  end
end
d.work
# work in class Developer

class << d
  def work
    puts 'work in class << d'
  end
end
d.work
# work in class << d
