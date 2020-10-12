# Ruby include extend

## For method

- `include` will add the instance method in module as instance method into class.
- `extend` will add the instance method in module as class method into class.
- method in module, such as self.method, Module.method can not be added into class when use include or extend.

## For constant

### Demo1

[demo1.rb](./demo1.rb)

```ruby
module Test
  C = 10
end

class Person1
  include Test

  def self.method1
    puts self.inspect
    puts self.ancestors.inspect
    puts Module.nesting.inspect
    puts C
  end
end

Person1.method1
puts "Person1.constants: #{Person1.constants}"
puts "Person1.singleton_class.constants: #{Person1.singleton_class.constants}"
```

in above demo, we use include and self.method1, this can access the constant in the module.

### Demo2

[demo2.rb](./demo2.rb)

```ruby
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
```

in above demo, we use extend and class << self, this can access the constant in the module.

## include vs extend

```ruby
class XXX
  extend module
end
```

等效于

```ruby
class XXX
  class << self
    include module
  end
end
```

## Conclusion

- `include` with self.method can access the constant in the module.
- `extend` with class << self can access the constant in the module.
- `extend` open a singleton class, and then add the instance method and variables.
