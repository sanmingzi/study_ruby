# Ruby include extend

## For method

- `include` will add the instance method in module as instance method into class.
- `extend` will add the instance method in module as class method into class.
- method in module, such as self.method, Module.method can not be added into class when use include or extend.

## For constant

[ruby_include_extend.rb](src/ruby_include_extend.rb)

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
