# Ruby singleton class

http://www.devalot.com/articles/2008/09/ruby-singleton

## Open the singleton class directly
```
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
```

```
arr -> Singleton -> Array
```

The method "size" is overwrite in the singleton class.
But when you use "arr.class", it return "Array" instead.

## singleton method from module

```
module Foo
  def foo
  end
end

arr = []
arr.extend(Foo)
puts arr.singleton_methods.inspect
```

## useage of singleton class

Ruby only supports instance methods. Where do all those class methods you have been creating end up? Thi singleton class do this.