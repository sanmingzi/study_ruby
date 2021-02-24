# Lookup the constant from Module.nesting

module A
  NAME = 'Matz'
end

module A
  module B
    puts Module.nesting.inspect # [A::B, A]
    puts NAME # Matz
  end
end

module A::C
  puts Module.nesting.inspect # [A::C]
  begin
    puts NAME
  rescue => exception
    puts exception.inspect # #<NameError: uninitialized constant A::C::NAME
  end
end

# Lookup the constant from ancestors

module B
  include A # use include, the A is the ancestor of B

  puts Module.nesting.inspect # [B]
  puts self.ancestors.inspect # [B, A]
  puts NAME # Matz
end

module C
  extend A # => use extend, the A is the ancestor of singleton_class

  class << self
    puts Module.nesting.inspect # [#<Class:C>, C]
    puts self.ancestors.inspect # [#<Class:C>, A, Module, Object, Kernel, BasicObject]
    puts NAME # Matz
  end
end
