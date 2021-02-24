class Object
  def metaclass_example
    class << self
      puts "#{self.inspect}.metaclas_example"
      self
    end
  end
end

class Developer
  def frontend
    puts "#{self.inspect}.frontend"
  end

  class << self
    def backend
      puts "#{self.inspect}.backend"
    end
  end
end

d = Developer.new
d.frontend
#<Developer:0x0000556162b79df0>.frontend

d.metaclass_example
#<Class:#<Developer:0x0000556162b79df0>>.metaclas_example

puts d.singleton_class.inspect
#<Class:#<Developer:0x0000556162b79df0>>

Developer.backend
# Developer.backend

Developer.metaclass_example
#<Class:Developer>.metaclas_example

puts Developer.singleton_class.inspect
#<Class:Developer>

puts Developer.instance_methods false
# frontend

puts Developer.singleton_class.instance_methods false
# backend
