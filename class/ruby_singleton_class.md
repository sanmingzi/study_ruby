# Ruby singleton class

## Open the singleton class directly

```ruby
arr = Array.new

class << arr
  def size
    puts "arr.size"
    puts super
  end

  def name=(name)
    @name = name
  end

  def name
    @name
  end
end

arr.size
arr.name="sorted array"
puts arr.name

# arr -> Singleton -> Array
```

The method "size" is overwrite in the singleton class.
But when you use "arr.class", it return "Array" instead.

## Singleton method from module

```ruby
module Foo
  def foo
  end
end

arr = []
arr.extend(Foo)
puts arr.singleton_methods.inspect
```

## Usage of singleton class

Ruby only supports instance methods. Where do all those class methods you have been creating end up? Thi singleton class do this.

## Reference

- http://www.devalot.com/articles/2008/09/ruby-singleton
