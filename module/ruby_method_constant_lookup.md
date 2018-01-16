# Ruby method and constant find

## Constant lookup

### Module.nesting

```ruby
module A
  NAME = 'zhiming'
end

module A
  module B
    puts Module.nesting.inspect
    puts NAME
  end
end

module A::C
  puts
  puts Module.nesting.inspect
  puts NAME # => error, do not include A in nesting
end
```

### Ancestors

If can not find the constant in the nesting, it will find the constant in the ancestors.

```ruby
module A
  NAME = 'zhiming'
end

module B
  include A # use include, the A is the ancestor of B

  puts Module.nesting.inspect
  puts self.ancestors.inspect
  puts NAME
end

module C
  extend A # => use extend, the A is the ancestor of singleton_class

  class << self
    puts
    puts Module.nesting.inspect
    puts self.ancestors.inspect
    puts NAME
  end
end
```

## Method lookup

### Instance method lookup

```ruby
class Animal
  def eat
    puts 'Animal is eating'
  end
end

module Eat
  def eat
    puts 'eat in the module Eat'
    super
  end
end

class Dog < Animal
  include Eat
end

wangcai = Dog.new
wangcai.eat

class << wangcai
  def eat
    puts 'wangcai is eating'
  end
end

wangcai.eat

puts wangcai.singleton_class.ancestors.inspect
# [#<Class:#<Dog:0x007fdf4c1dc918>>, Dog, Eat, Animal, Object, Kernel, BasicObject]
```

- find in singleton_class of the object
- find ancestors of singleton_class

### Class method lookup

```ruby
class Animal
  def self.eat
    puts 'Animal is eating'
  end
end

module Eat
  def eat
    puts 'eat in the module Eat'
    super
  end
end

class Dog < Animal
  class << self
    include Eat
  end
end

Dog.eat
puts Dog.singleton_class.ancestors.inspect
# [#<Class:Dog>, Eat, #<Class:Animal>, #<Class:Object>, #<Class:BasicObject>, Class, Module, Object, Kernel, BasicObject]
```

- find in singleton_class of the object (Class also is an object)
- find ancestors of singleton_class