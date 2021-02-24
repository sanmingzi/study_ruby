class Developer
  def self.backend
    puts "#{self}.backend"
  end

  def frontend
    puts "#{self}.frontend"
  end
end

developer1 = Developer.new

[developer1, Developer, Class, Module, Object, BasicObject].each do |obj|
  puts "#{obj}.class is #{obj.class.inspect}"
end

# #<Developer:0x00005585d8416140>.class is Developer
# Developer.class is Class
# Class.class is Class
# Module.class is Class
# Object.class is Class
# BasicObject.class is Class

[Developer, Class, Module, Object, BasicObject].each do |obj|
  puts "#{obj}.superclass is #{obj.superclass.inspect}"
end

# Developer.superclass is Object
# Class.superclass is Module
# Module.superclass is Object
# Object.superclass is BasicObject
# BasicObject.superclass is nil
