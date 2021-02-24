class Developer
end

puts Developer.ancestors.inspect
# [Developer, Object, Kernel, BasicObject]

puts Developer.class.ancestors.inspect
# [Class, Module, Object, Kernel, BasicObject]

puts Developer.singleton_class.ancestors.inspect
# [#<Class:Developer>, #<Class:Object>, #<Class:BasicObject>, Class, Module, Object, Kernel, BasicObject]

class BasicObject
  def work
    puts 'work in class BasicObject'
  end
end
Developer.work

puts Kernel.class
# Module
Kernel.class_eval do
  def work
    puts 'Kernel.class_eval def work'
  end
end
Developer.work
# Kernel.class_eval def work

class Object
  def work
    puts 'work in class Object'
  end
end
Developer.work
# work in class Object

class Module
  def work
    puts 'work in class Module'
  end
end
Developer.work
# work in class Module

class Class
  def work
    puts 'work in class Class'
  end
end
Developer.work
# work in class Class

class << BasicObject
  def work
    puts 'work in class << BasicObject'
  end
end
Developer.work
# work in class << BasicObject

class << Object
  def work
    puts 'work in class << Object'
  end
end
Developer.work
# work in class << Object

class << Developer
  def work
    puts 'work in class << Developer'
  end
end
Developer.work
# work in class << Developer
